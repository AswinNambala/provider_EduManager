import 'package:edu_manager_provider/constant/utils.dart';
import 'package:edu_manager_provider/widget/form_felid.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({super.key});
  final TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Column(
        children: [
          AllTextFormField(
            controller: searchCtrl,
            onChange: (value) {
              
            },
            label: 'Search by name, id . . . .',
            preffixIcon:const Icon(Icons.search),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: 60,
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'List',
                        style: TextStyle(fontSize: 20, color: textColor),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: 60,
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_view_outlined,
                        size: 23,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Grid',
                        style: TextStyle(fontSize: 20, color: textColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
