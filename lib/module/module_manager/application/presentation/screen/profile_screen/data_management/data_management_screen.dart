import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DataManagementScreen extends StatelessWidget {
  const DataManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      )),
                  Text(
                    'Data Management',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: kwhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Archived Cards',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                GoRouter.of(context).pushNamed(Routes.archivedCardScreen);
                              },
                              icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: kwhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Deleted Cards',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                GoRouter.of(context).pushNamed(Routes.deletedCardScreen);
                              },
                              icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ),
                  ),
                    const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: kwhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Export Data',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ),
                  ),
                    const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: kwhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Import Data',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
