import 'package:detective_conan/utilities/images.dart';
import 'package:flutter/material.dart';

import '../utilities/media_quary.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatefulWidget {
  final bool isHome;
  final String title;

  final Function(String)? onChanged;
  const CustomAppBar(
      {super.key, this.isHome = false, this.title = 'home', this.onChanged});

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
                AnimatedCrossFade(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 700),
                  firstChild: Container(),
                  secondChild: Image.asset(
                    AppImages.logo,
                    scale: 4.5,
                  ),
                  crossFadeState: isSearch
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
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
                  child: /*  isSearch
                      ?  */
                      AnimatedCrossFade(
                    duration: const Duration(milliseconds: 700),
                    firstChild: Row(
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 700),
                          opacity: 1,
                          child: CustomIconButton(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              setState(() {
                                isSearch = !isSearch;
                              });
                            },
                          ),
                        ),
                        isSearch
                            ? Expanded(
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
                            : Container()
                      ],
                    ),
                    secondChild: CustomIconButton(
                      icon: Icons.search,
                      onPressed: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                    ),
                    crossFadeState: isSearch
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  /*  AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: isSearch ? 1 : 0,
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 700),
                            opacity: 1,
                            child: CustomIconButton(
                              icon: isSearch ? Icons.arrow_back : Icons.search,
                              onPressed: () {
                                setState(() {
                                  isSearch = !isSearch;
                                });
                              },
                            ),
                          ),
                          isSearch
                              ? Expanded(
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 700),
                                    opacity: isSearch ? 1 : 0,
                                    child: TextFormField(
                                        cursorColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        decoration: const InputDecoration(
                                          hintText: 'Find a character...',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 18),
                                        onChanged: widget.onChanged),
                                  ),
                                )
                              : Container()
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
                        ), */
                ),
              ],
            ),
          )
        : Row(children: [
            const CustomIconButton(icon: Icons.arrow_back, isPop: true),
            Text(widget.title),
            const Spacer(),
          ]);
  }
}
