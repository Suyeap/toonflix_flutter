import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final double offsetY;

  final blackColor = const Color.fromARGB(255, 41, 43, 44);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.offsetY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, offsetY),
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: isInverted ? Colors.white : blackColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: isInverted ? blackColor : Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            amount,
                            style: TextStyle(
                              color: isInverted ? blackColor : Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            code,
                            style: TextStyle(
                              color: isInverted
                                  ? blackColor.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Transform.translate(
                      offset: const Offset(-3, 10),
                      child: Icon(
                        icon,
                        color: isInverted ? blackColor : Colors.white,
                        size: 75,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
