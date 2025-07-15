import 'package:flutter/material.dart';
import '../../models/inventory_item.dart';
import '../../utils/colors.dart';

class InventoryItemCard extends StatelessWidget {
  final InventoryItem item;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final Function(int)? onQuantityChanged;

  const InventoryItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.onEdit,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with name, category, and stock status
              Row(
                children: [
                  Icon(
                    item.category.icon,
                    size: 20,
                    color: PerseveranceColors.buttonFill,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: PerseveranceColors.buttonFill,
                          ),
                        ),
                        Text(
                          item.category.displayName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: item.stockStatusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: item.stockStatusColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      item.stockStatusText,
                      style: TextStyle(
                        color: item.stockStatusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Description
              Text(
                item.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PerseveranceColors.secondaryText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 12),
              
              // Quantity and controls
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item.quantity} / ${item.minimumStock} min',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: PerseveranceColors.buttonFill,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (onQuantityChanged != null) ...[
                    IconButton(
                      onPressed: () => onQuantityChanged!(item.quantity - 1),
                      icon: const Icon(Icons.remove_circle_outline),
                      color: PerseveranceColors.secondaryText,
                      iconSize: 20,
                      tooltip: 'Decrease quantity',
                      semanticsLabel: 'Decrease quantity',
                    ),
                    IconButton(
                      onPressed: () => onQuantityChanged!(item.quantity + 1),
                      icon: const Icon(Icons.add_circle_outline),
                      color: PerseveranceColors.buttonFill,
                      iconSize: 20,
                      tooltip: 'Increase quantity',
                      semanticsLabel: 'Increase quantity',
                    ),
                  ],
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Location and part number
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          item.location,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: PerseveranceColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Part #',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: PerseveranceColors.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          item.partNumber,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: PerseveranceColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Cost and supplier info
              if (item.cost != null || item.supplier != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (item.cost != null) ...[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cost',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: PerseveranceColors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              item.formattedCost,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: PerseveranceColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (item.supplier != null) ...[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Supplier',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: PerseveranceColors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              item.supplier!,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: PerseveranceColors.secondaryText,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
              
              // Last updated
              const SizedBox(height: 8),
              Text(
                'Last updated: ${item.formattedLastUpdated}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: PerseveranceColors.secondaryText.withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 