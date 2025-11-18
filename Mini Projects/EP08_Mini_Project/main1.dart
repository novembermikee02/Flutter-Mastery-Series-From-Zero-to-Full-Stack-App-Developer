import 'dart:io';
// We import dart:io because we want to use stdin (to take user input) and stdout (to print messages).
// Without this import, user input won’t work.

enum Category { electronics, grocery, fashion }

enum Membership { none, silver, gold }

// We create two enums:

// 🔹 Category

// 3 product categories → electronics, grocery, fashion
// Enums are used to avoid mistakes like spelling errors (ex: “elctronics”).
// They give fixed options.

// 🔹 Membership

// 3 membership levels → none, silver, gold
// We will use this to apply discounts.

// Enums make your code cleaner and safer.

// Helper Function

String input(String msg) {
  stdout.write(msg);
  return stdin.readLineSync() ?? "";
}

// ✔ Explanation

// This small function makes taking input easier.

// stdout.write(msg); → Shows a message without adding a new line.

// stdin.readLineSync() → Waits for user typing.

// ?? "" → If user types nothing or null, return empty string.

// This avoids repeating the same input code again and again.

// 📌 Main Function

void main() {
  print("\n======= SMART SHOPPING BILL CALCULATOR =======\n");

  // ✔ Explanation

  // main() is where execution starts.

  // We print a title to make the output look clean.

  // STEP 1 – Category Selection

  print("Choose Category:");
  print("1. Electronics");
  print("2. Grocery");
  print("3. Fashion");

  // Shows options for the user.

  String cat = input("Enter option (1-3): ");

  // We take user input (1,2,3).

  Category category;

  if (cat == "1") {
    category = Category.electronics;
  } else if (cat == "2") {
    category = Category.grocery;
  } else {
    category = Category.fashion;
  }

  // ✔ Explanation

  // category is a variable of enum type.

  // Based on input 1–3, we assign the correct enum.

  // If user enters something other than 1 or 2, we default to fashion.

  // This is if-else decision making in action.

  // STEP 2 – Show Products Based on Category

  // print("\nAvailable Products:");

  // ✔ Using if-else to show category-wise products

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

  //   ✔ Explanation

  // This block dynamically displays products depending on the selected category.

  // If electronics → show laptop, mobile
  // If grocery → show rice, oil
  // If fashion → show tshirt, jeans

  // This teaches the concept of branching using if-else.

  String product = input("Enter product name: ").toLowerCase();

  // We convert input to lowercase so that input becomes case-insensitive.

  // STEP 3 – Set Price Using SWITCH + Nested IF

  double price = 0;
  // Price variable created.

  switch (category) {
    // ✔ Explanation

    // We use switch-case because we want to check the category in a clean way.

    // Switch is better than multiple if/else when checking one variable with fixed choices.

    // Inside Switch → Nested IF

    // Example for electronics:
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

  // ✔ Explanation

  // Inside each category, we again use nested if to match the product.

  // If product is not valid → we stop the program using return.

  // This demonstrates:

  // switch-case

  // nested if

  // input validation

  // STEP 4 – Quantity Input
  int qty = int.parse(input("Enter quantity: "));

  //   ✔ Explanation

  // We take quantity as string

  // Convert it into an integer using int.parse()

  // If user inputs "3", it becomes integer 3.

  // STEP 5 – Membership Selection

  print("\nChoose Membership:");
  print("1. None");
  print("2. Silver");
  print("3. Gold");

  // Shows membership types.

  String mem = input("Enter option (1-3): ");

  // Take membership option.

  Membership membership;

  if (mem == "3") {
    membership = Membership.gold;
  } else if (mem == "2") {
    membership = Membership.silver;
  } else {
    membership = Membership.none;
  }

  //   ✔ Explanation

  // Same pattern as category selection.

  // Assign correct enum based on user input.

  // STEP 6 – Calculate Bill

  double total = price * qty;
  // ✔ Explanation

  // Simple math.
  // (If product price = 50, qty = 2 → total = 100)

  // Membership Discount Logic Using If-Else

  double discountRate = 0;

  if (membership == Membership.gold) {
    discountRate = 0.20;
  } else if (membership == Membership.silver) {
    discountRate = 0.10;
  }

  // ✔ Explanation

  // Gold → 20% discount

  // Silver → 10%

  // None → 0%

  // This teaches how to use if-else logic based on enums.

  double discountAmount = total * discountRate;
  //   🧮 Example:

  // Let’s assume:

  // total = ₹1000

  // discountRate = 0.20 (Gold membership = 20%)

  // discountAmount = 1000 × 0.20 = 200

  //   ✔ Meaning:

  // Customer will get ₹200 discount.

  double afterDiscount = total - discountAmount;
  //   👉 What it means:

  // We subtract the discount from the total price.
  // Calculating discount and final amount.

  // 🧮 Example continued:

  // total = ₹1000

  // discountAmount = ₹200
  // afterDiscount = 1000 - 200 = 800
  //   ✔ Meaning:

  // Customer will pay ₹800 after discount.

  // Ternary Operator

  // if (afterDiscount > 500) {
  //    delivery = 0;
  // } else {
  //    delivery = 50;
  // }

  // It replaces this:
  double delivery = afterDiscount > 500 ? 0 : 50;

  // “Is the after-discount amount greater than ₹500?”

  // If YES → delivery = 0 (FREE delivery)

  // If NO → delivery = 50 (delivery charges apply)

  // 💡 Example 1: afterDiscount = 800
  // 800 > 500 ? 0 : 50
  //   👉 800 is greater than 500
  // ✔ So delivery = 0
  // ➡ Free delivery

  // Example 2: afterDiscount = 350
  // 350 > 500 ? 0 : 50
  // 👉 350 is NOT greater than 500
  // ✔ So delivery = 50
  // ➡ Delivery charge ₹50

  // 🎯 Why 500?

  // Because in many real shopping apps:

  // Orders above ₹500 → FREE Delivery

  // Orders below ₹500 → Delivery charges apply

  // We copy that same real-world logic.

  // ✔ Explanation

  // Ternary operator checks a condition:

  // If after discount total > 500 → delivery = 0
  // else → delivery = 50

  // This teaches how to replace if-else with simple ternary.
  // }

  // Final calculation:

  double finalTotal = afterDiscount + delivery;

  // STEP 7 – Print Final Bill

  // The following lines print the entire bill summary:

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

  //   ✔ Explanation

  // $variable is string interpolation

  // Shows clean bill format

  // Helps students understand how to format console UI
}
