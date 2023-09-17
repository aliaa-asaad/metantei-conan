import 'package:flutter/material.dart';
import 'package:metantei_conan/utilities/images.dart';

import '../utilities/media_quary.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatefulWidget {
  final bool isHome;
  final String title;

  final Function(String) onChanged;
  const CustomAppBar(
      {super.key,
      this.isHome = false,
      this.title = 'home',
      required this.onChanged});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return widget.isHome
        ? Center(
            child: Row(
              children: [
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: isSearch ? 0 : 1,
                    child: isSearch
                        ? Container()
                        : Image.asset(
                            AppImages.logo,
                            /* height: MediaQueryHelper.height * .096,
                          width: MediaQueryHelper.width * .196, */
                            scale: 4.5,
                          )),
                const Spacer(),
                AnimatedContainer(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.primary),
                  duration: const Duration(milliseconds: 700),
                  width: isSearch
                      ? MediaQueryHelper.width * .93
                      : MediaQueryHelper.width * .11,
                  child: isSearch
                      ? AnimatedOpacity(
                          duration: const Duration(milliseconds: 700),
                          opacity: isSearch ? 1 : 0,
                          child: Row(
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 700),
                                opacity: isSearch ? 1 : 0,
                                child: CustomIconButton(
                                  icon: Icons.arrow_back,
                                  onPressed: () {
                                    setState(() {
                                      isSearch = !isSearch;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 700),
                                  opacity: isSearch ? 1 : 0,
                                  child: TextFormField(
                                      cursorColor:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: const InputDecoration(
                                        hintText: 'Find a character...',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 18),
                                      onChanged: widget.onChanged),
                                ),
                              )
                            ],
                          ),
                        )
                      : AnimatedOpacity(
                          duration: const Duration(milliseconds: 700),
                          opacity: isSearch ? 0 : 1,
                          child: CustomIconButton(
                            icon: Icons.search,
                            onPressed: () {
                              setState(() {
                                isSearch = !isSearch;
                              });
                            },
                          ),
                        ),
                ),
              ],
            ),
          )
        : Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Text(widget.title),
            const Spacer(),
            const CustomIconButton(icon: Icons.arrow_back),
          ]);
  }
}
