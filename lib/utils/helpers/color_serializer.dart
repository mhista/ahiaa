import 'package:flutter/material.dart';

class ColorSerializer {
  // Convert Color to Hex String
  static String colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0')}';
  }

  // Convert Hex String to Color
  static Color hexToColor(String hexString) {
    final hexColor = hexString.replaceAll('#', '');
    return Color(int.parse('0x$hexColor'));
  }

  // Check if a string is a valid hex color
  static bool isHexColor(String value) {
    return value.startsWith('#') &&
        (value.length == 7 || value.length == 9) &&
        int.tryParse(value.substring(1), radix: 16) != null;
  }
}

// // Example usage when storing colors
// void addColorAttribute(Color color) {
//   final productAttribute = ProductAttributeModel(
//     name: 'color',
//     values: [color], // This will be properly serialized
//   );
  
//   // Now you can use this for your API call
//   final json = productAttribute.toMap();
//   print(json); // Properly serializable JSON with hex color
// }

// // Example usage when retrieving colors
// Color? parseColorFromAttribute(ProductAttributeModel attribute) {
//   if (attribute.name == 'color' && 
//       attribute.values != null && 
//       attribute.values!.isNotEmpty) {
      
//     final colorValue = attribute.values!.first;
    
//     // Handle both cases: hex string from server or Color object in memory
//     if (colorValue is String && ColorSerializer.isHexColor(colorValue)) {
//       return ColorSerializer.hexToColor(colorValue);
//     } else if (colorValue is Color) {
//       return colorValue;
//     }
//   }
//   return null;
// }