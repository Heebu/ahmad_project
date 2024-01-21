import 'package:flutter/material.dart';

import '../../../Reuseables/other_sidebar_temp.dart';

class AboutViews extends StatelessWidget {
  const AboutViews({super.key});

  @override
  Widget build(BuildContext context) {
    return OtherTemp(
      title: 'About',
      image: 'images/about.png',
      text:
          'The word estate is colloquially used to refer to all of the land and improvements on a vast property, often some farm or homestead or the historic home of a prominent family. '
          'However, in the financial and legal sense of the term, an estate refers to everything of value that an individual owns real estate, art collections, antique items, investments, insurance, and any other assets and entitlements and is also used as an overarching way to refer to a'
          ' person\'s net worth. Legally, a person\'s estate refers to an individual\'s '
          'total assets minus any liabilities. The value of a personal estate is of particular relevance in two cases: if the individual declares bankruptcy and if the individual dies. '
          'When an individual debtor declares bankruptcy, their estate is assessed to determine which of their debts they can be reasonably expected to pay. '
          'Bankruptcy proceedings involve the same rigorous legal assessment of an estate that also occurs upon an individual\'s death.',
    );
  }
}
