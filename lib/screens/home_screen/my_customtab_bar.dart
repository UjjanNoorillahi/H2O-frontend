import 'package:flutter/cupertino.dart';

class MyCustomTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  MyCustomTabBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        boxShadow: const [
          BoxShadow(
            color: CupertinoColors.black,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(0, CupertinoIcons.home, 'Home'),
          _buildTabItem(1, CupertinoIcons.chat_bubble_2_fill, 'Chat'),
          _buildTabItem(2, CupertinoIcons.money_dollar_circle, 'Wallet'),
          _buildTabItem(3, CupertinoIcons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: currentIndex == index
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.inactiveGray,
            ),
            Text(
              label,
              style: TextStyle(
                color: currentIndex == index
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.inactiveGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
