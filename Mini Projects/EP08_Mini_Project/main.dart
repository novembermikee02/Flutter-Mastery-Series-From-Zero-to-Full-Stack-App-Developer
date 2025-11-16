/*
====================================
EP08 – MINI PROJECT: SHOPPING BILL CALCULATOR
Created by: Webiyor
====================================
This project covers:
- Control Flow (if, else, nested if)
- Switch Case (numbers, strings)
- Enums
- Ternary Operator
- User Input
====================================
*/

import 'dart:io';

// Enums (Category & Membership)
enum Category { electronics, grocery, fashion }

enum Membership { none, silver, gold }

// Simple helper function for input
String input(String msg) {
  stdout.write(msg);
  return stdin.readLineSync() ?? "";
}

void main() {
  print("\n======= SMART SHOPPING BILL CALCULATOR =======\n");

  // -----------------------------------------
  // STEP 1: Select Category
  // -----------------------------------------
  print("Choose Category:");
  print("1. Electronics");
  print("2. Grocery");
  print("3. Fashion");

  String cat = input("Enter option (1-3): ");

  Category category;

  if (cat == "1") {
    category = Category.electronics;
  } else if (cat == "2") {
    category = Category.grocery;
  } else {
    category = Category.fashion;
  }

  // -----------------------------------------
  // STEP 2: Show Products + Select Product
  // -----------------------------------------
  print("\nAvailable Products:");

  if (category == Category.electronics) {
    print("- laptop");
    print("- mobile");
  } else if (category == Category.grocery) {
    print("- rice");
    print("- oil");
  } else {
    print("- tshirt");
    print("- jeans");
  }

  String product = input("Enter product name: ").toLowerCase();

  // -----------------------------------------
  // STEP 3: Set Price using SWITCH + nested IF
  // -----------------------------------------
  double price = 0;

  switch (category) {
    case Category.electronics:
      if (product == "laptop") {
        price = 50000;
      } else if (product == "mobile") {
        price = 15000;
      } else {
        print("Invalid product selected!");
        return;
      }
      break;

    case Category.grocery:
      if (product == "rice") {
        price = 50;
      } else if (product == "oil") {
        price = 120;
      } else {
        print("Invalid product selected!");
        return;
      }
      break;

    case Category.fashion:
      if (product == "tshirt") {
        price = 400;
      } else if (product == "jeans") {
        price = 1200;
      } else {
        print("Invalid product selected!");
        return;
      }
      break;
  }

  // -----------------------------------------
  // STEP 4: Quantity
  // -----------------------------------------
  int qty = int.parse(input("Enter quantity: "));

  // -----------------------------------------
  // STEP 5: Choose Membership
  // -----------------------------------------
  print("\nChoose Membership:");
  print("1. None");
  print("2. Silver");
  print("3. Gold");

  String mem = input("Enter option (1-3): ");

  Membership membership;

  if (mem == "3") {
    membership = Membership.gold;
  } else if (mem == "2") {
    membership = Membership.silver;
  } else {
    membership = Membership.none;
  }

  // -----------------------------------------
  // STEP 6: Calculate Bill
  // -----------------------------------------
  double total = price * qty;

  // If-Else discount logic
  double discountRate = 0;

  if (membership == Membership.gold) {
    discountRate = 0.20;
  } else if (membership == Membership.silver) {
    discountRate = 0.10;
  }

  double discountAmount = total * discountRate;
  double afterDiscount = total - discountAmount;

  // Ternary → Delivery fee
  double delivery = afterDiscount > 500 ? 0 : 50;

  double finalTotal = afterDiscount + delivery;

  // -----------------------------------------
  // STEP 7: Print Final Bill
  // -----------------------------------------
  print("\n=========== FINAL BILL ===========");
  print("Category      : $category");
  print("Product       : $product");
  print("Quantity      : $qty");
  print("----------------------------------");
  print("Base Price    : ₹$price");
  print("Total Price   : ₹$total");
  print("Discount      : ${discountRate * 100}%");
  print("You Saved     : ₹$discountAmount");
  print("Delivery Fee  : ₹$delivery");
  print("----------------------------------");
  print("FINAL TOTAL   : ₹$finalTotal");
  print("==================================\n");
}
