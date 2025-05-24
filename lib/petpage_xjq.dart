import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  int selectedIndex = 0; // 0 = Collected, 1 = To Collect

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet House",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 上半部分头像区域
          const SizedBox(height: 20),
          const _PetProfile(),

          // 切换按钮区域
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSwitchButton("COLLECTED", 0),
              const SizedBox(width: 12),
              buildSwitchButton("TO COLLECT", 1),
            ],
          ),

          const SizedBox(height: 20),

          // 展示内容区域（用 IndexedStack）
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                Center(
                  child: Text("Collected pets here"),
                ), // 替换成你的 collected 列表
                Center(child: Text("To collect pets here")), // 替换成你的待收集列表
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchButton(String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Container(
      decoration:
          isSelected
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              )
              : null,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.transparent,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:
                isSelected
                    ? BorderSide(color: Colors.black, width: 1)
                    : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0, // 关闭默认阴影，避免与自定义冲突
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _PetProfile extends StatelessWidget {
  const _PetProfile();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Hector image
        Center(child: Image.asset('assets/image_xjq/Hector.png', height: 150)),
        const SizedBox(height: 20),

        //Hector name
        const Text(
          'Hector',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF001428),
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            height: 1.70,
          ),
        ),
        const SizedBox(height: 20),

        //Progress bar
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 3),
                blurRadius: 0,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 16,
              child: LinearProgressIndicator(
                value: 3 / 5,
                minHeight: 16,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Progress text
        const Text(
          '3 / 5 collected',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
