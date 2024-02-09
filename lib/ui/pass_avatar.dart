import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_data/mock_data.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter/foundation.dart' as foundation;

import '../logic/panel_provider.dart';
import '../logic/pass_avatar_provider.dart';
import '../logic/user_provider.dart';
import '../model/my_user.dart';
import '../model/pass_avatar.dart';
import '../pass_avatar/pass_avatar_list_tile.dart';
import '../theme/my_color.dart';
import '../theme/my_theme.dart';

@RoutePage()
class PassAvatarPage extends ConsumerStatefulWidget {
  const PassAvatarPage({super.key});

  @override
  ConsumerState createState() => _PassAvatarPageState();
}

class _PassAvatarPageState extends ConsumerState<PassAvatarPage> {
  final pTheme = SlidingPanelTheme();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () async {
        if (_controller.text.length >= 6) {
          List<String> oldList = await ref.watch(passAvatarProvider.future);
          debugPrint("45--$oldList");
          await ref
              .watch(searchAvatarCodeProvider(_controller.text).future)
              .then(
            (List<String> list) {
              for (var id in list) {
                if (!oldList.contains(id)) {
                  ref.read(passNewAvatarProvider(id));
                }
              }
              FocusScope.of(context).unfocus();
            },
          );
        }
      },
    );
  }

  void _onBackspacePressed() {
    final text = _controller.value.text;
    var cursorPosition = _controller.selection.base.offset;

    // If cursor is not set, then place it at the end of the textfield
    if (cursorPosition < 0) {
      _controller.selection = TextSelection(
        baseOffset: _controller.text.length,
        extentOffset: _controller.text.length,
      );
      cursorPosition = _controller.selection.base.offset;
    }

    if (cursorPosition >= 0) {
      final selection = _controller.value.selection;
      final newTextBeforeCursor =
          selection.textBefore(text).characters.skipLast(1).toString();

      _controller.value = _controller.value.copyWith(
        text: newTextBeforeCursor + selection.textAfter(text),
        selection: TextSelection.fromPosition(
          TextPosition(offset: newTextBeforeCursor.length),
        ),
        composing: TextRange.collapsed(newTextBeforeCursor.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final PanelController panelController = ref.watch(passAvatarPanelProvider);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        toolbarHeight: 120.h,
        titleSpacing: 0,
        centerTitle: true,
        title: Container(
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: TextFormField(
            //minLines: 1,
            expands: true,
            maxLines: null,
            maxLength: 6,
            controller: _controller,
            keyboardType: TextInputType.none,
            cursorColor: drabDarkBrown,
            onTap: () {
              if (panelController.isPanelClosed) {
                panelController.open();
              }
            },
            //showCursor: false,

            style: TextStyle(
              color: chocolateCosmos,
              fontSize: 24.r,
              height: 1.35.r,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.12.r,
            ),
            decoration: InputDecoration(
              hintText: [
                'Type new emojis to share new avatar',
                'Put new emojis to share new avatar.',
              ][mockInteger(0, 1)],
              icon: InkWell(
                onTap: () async {
                  final clipboardData =
                      await Clipboard.getData(Clipboard.kTextPlain);
                  String? clipboardText = clipboardData?.text;
                  _controller.text = clipboardText ?? "";
                },
                child: const Icon(Icons.content_paste_go),
              ),
              iconColor: gray,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.45.r, color: gray),
                borderRadius: BorderRadius.circular(45.r),
                gapPadding: 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.3.r, color: richBlack),
                borderRadius: BorderRadius.circular(45.r),
                gapPadding: 0,
              ),
              suffixIcon: InkWell(
                onTap: _onBackspacePressed,
                child: Container(
                  margin: EdgeInsets.only(right: 7.5.w),
                  child: Icon(Icons.backspace, size: 24.r, color: hookerGreen),
                ),
              ),
              contentPadding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 30.h,
              ),
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                letterSpacing: 0,
                fontSize: 13.5.r,
                color: gray,
                fontWeight: FontWeight.w300,
              ),
              counterStyle: TextStyle(
                fontFamily: 'Poppins',
                letterSpacing: 1.2.r,
                color: gray,
              ),
              isDense: false,
              isCollapsed: false,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SlidingUpPanel(
          backdropEnabled: true,
          controller: panelController,
          minHeight: 0,
          maxHeight: 240.h,
          panel: EmojiPicker(
            onEmojiSelected: (Category? category, Emoji emoji) {
              //_controller.text += emoji.emoji;
              // Do something when emoji is tapped (optional)
            },

            textEditingController: _controller,
            // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
            config: Config(
              //height: 256,
              // bgColor: const Color(0xFFF2F2F2),
              checkPlatformCompatibility: true,
              emojiViewConfig: EmojiViewConfig(
                emojiSizeMax: 28 *
                    (foundation.defaultTargetPlatform == TargetPlatform.iOS
                        ? 1.20
                        : 1.0),
              ),
              swapCategoryAndBottomBar: false,
              skinToneConfig: const SkinToneConfig(),
              categoryViewConfig: const CategoryViewConfig(),
              bottomActionBarConfig: BottomActionBarConfig(
                customBottomActionBar: (_, __, ___) => Container(),
              ),
              searchViewConfig: SearchViewConfig(
                customSearchView: (_, __, ___) => Container(),
              ),
            ),
          ),
          body: const _PassAvatarState(),
          onPanelClosed: () => FocusScope.of(context).unfocus(),
        ),
      ),
    );
  }
}

class _PassAvatarState extends ConsumerWidget {
  const _PassAvatarState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUser? myUser = ref.watch(myUserProvider).value;

    final num passAvatarCount = ref.watch(strPassAvatarCountProvider).maybeWhen(
          orElse: () => 0,
          data: (x) => x,
        );

    return Column(
      children: [
        AspectRatio(
          aspectRatio: (myUser?.avatar?.isNotEmpty ?? false) ? 1.35 : 1.5,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: const BoxDecoration(color: majorelleBlue),
            child: Stack(
              children: [
                if (myUser?.avatar?.isNotEmpty ?? false)
                  Positioned.fill(
                    bottom: -90.r,
                    right: -60.r,
                    left: 210.r,
                    child: FadeInUp(
                      child: RandomAvatar(
                        myUser?.avatar ?? mockString(4),
                        trBackground: true,
                      ),
                    ),
                  ),
                Positioned(
                  left: 15.r,
                  top: 24.r,
                  right: 15.r,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _TapAvatarText(),
                      _TapAvatarCloseButton(),
                    ],
                  ),
                ),
                Positioned(
                  left: 7.5.r,
                  top: 60.h,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [9.r, 4.5.r],
                    color: ghostWhite,
                    strokeWidth: 1,
                    radius: Radius.circular(30.r),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: InkWell(
                      onTap: () => Clipboard.setData(
                        ClipboardData(text: myUser?.avatarCode ?? ""),
                      ),
                      child: Container(
                        width: 150.w,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          myUser?.avatarCode ?? "",
                          style: TextStyle(
                            fontSize: 24.r,
                            letterSpacing: 0.3.r,
                            color: lavenderWeb,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15.r,
                  bottom: 15.r,
                  height: 105.h,
                  width: 180.w,
                  child: Container(
                    alignment: Alignment.center,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      subtitle: Container(
                        height: 21.h,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Avatars, users shared this week",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            color: ghostWhite,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.r,
                          ),
                          minFontSize: 9,
                          maxFontSize: 12,
                          maxLines: 1,
                          wrapWords: false,
                        ),
                      ),
                      title: Container(
                        height: 48.h,
                        alignment: Alignment.bottomLeft,
                        child: AnimatedFlipCounter(
                          value: passAvatarCount,
                          wholeDigits: 2,
                          textStyle: TextStyle(
                            fontSize: 30.r,
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.3.r,
                            color: ghostWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(15.r),
        const _PassAvatarAnimatedList(),
      ],
    );
  }
}

class _TapAvatarText extends StatelessWidget {
  const _TapAvatarText();

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Tap and share the below code to get a new avatar",
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: ghostWhite,
        fontSize: 21.r,
        fontWeight: FontWeight.normal,
      ),
      minFontSize: 9,
      maxFontSize: 12,
      stepGranularity: 1.5,
    );
  }
}

class _TapAvatarCloseButton extends StatelessWidget {
  const _TapAvatarCloseButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pop(),
      child: Icon(
        Icons.close,
        size: 21.r,
        color: lavenderWeb,
      ),
    );
  }
}

class _PassAvatarAnimatedList extends ConsumerWidget {
  const _PassAvatarAnimatedList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 300.h,
      child: FirebaseAnimatedList(
        query: ref.read(passAvatarQueryProvider),
        physics: const NeverScrollableScrollPhysics(),
        sort: (a, b) {
          final PassAvatar x = PassAvatar.fromSnapshot(a);
          final PassAvatar y = PassAvatar.fromSnapshot(b);
          return y.createdAt.compareTo(x.createdAt);
        },

        //reverse: true,
        itemBuilder: (_, DataSnapshot snapshot, animation, index) {
          PassAvatar passAvatar = PassAvatar.fromSnapshot(snapshot);
          return PassAvatarListTile(passAvatar);
        },
      ),
    );
  }
}
