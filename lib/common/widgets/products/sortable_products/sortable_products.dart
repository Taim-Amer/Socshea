import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/layouts/grid_layout.dart';
import 'package:socshea/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ["Name", "Higher Price", "Lower Price", "Sale", "Newest", "Popularity"]
              .map((option) => DropdownMenuItem(child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}
