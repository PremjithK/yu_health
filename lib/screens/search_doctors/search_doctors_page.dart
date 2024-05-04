import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/core/config/layout.dart';
import 'package:yu_health/core/providers/doctor_search_filter_provider.dart';
import 'package:yu_health/core/widgets/doctor_search_tile.dart';
import 'package:yu_health/core/widgets/filters_bar.dart';
import 'package:yu_health/core/widgets/yu_textfield.dart';

enum DoctorTypes { all, general, ortho, cardio, derma }

class SearchDoctorsPage extends StatefulWidget {
  const SearchDoctorsPage({super.key});

  @override
  State<SearchDoctorsPage> createState() => _SearchDoctorsPageState();
}

class _SearchDoctorsPageState extends State<SearchDoctorsPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('Find Doctors'),
      ),
      body: Padding(
        padding: PageLayout.pagePadding,
        child: Column(
          children: [
            Gap(5.h),
            YuTextField(
              validator: (value) {
                return null;
              },
              controller: _searchController,
              hint: 'Search by name or location',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
              maxLines: 1,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
            ),
            Gap(5.h),
            // Filter tags , Clear tags button
            Consumer<DoctorFilterProvider>(
              builder: (context, state, _) => FiltersBar(
                controller: _scrollController,
                onCleared: () {
                  state.clearAll();
                  _scrollController.animateTo(
                    0,
                    curve: Curves.bounceOut,
                    duration: Durations.long1,
                  );
                },
                tagList: state.selectedFilters,
                children: DoctorTypes.values
                    .map(
                      (item) => FilterItem(
                        label: item.name,
                        selected: state.selectedFilters
                            .contains(item.name.toUpperCase()),
                        onSelected: (selected) {
                          if (selected == true) {
                            state.addToFilter(item.name.toUpperCase());
                          } else if (selected == false) {
                            state.removeFromFilter(item.name.toUpperCase());
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Gap(10.h),
            // Doctors List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DoctorSearchTile(
                      name: "Doctor $index",
                      imageURL: 'http://$index',
                      designation: 'Designation $index',
                      locationName: 'Location $index',
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
            // Pagination
          ],
        ),
      ),
    );
  }
}
