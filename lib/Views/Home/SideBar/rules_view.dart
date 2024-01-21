import 'package:flutter/material.dart';

import '../../../Reuseables/other_sidebar_temp.dart';

class RulesView extends StatelessWidget {
  const RulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return OtherTemp(
      title: 'Rules',
      image: 'images/rules.png',
      text:
          ' 1. Each household i.e dwelling unit shall pay an annual subscription as determined by the Executive Committee of the Association. Such subscription shall be presented before the General Meeting and approved by the votes of a simple majority of members present. \n\n\ '
          '2. From time to time, a General Assembly Meeting may approve any stated sum of money for special projects as may be reviewed by the Executive Committee at its General Meetings, into the account of PVRA. \n\n\ '
          '3. Payment of annual dues is mandatory to all members of the Association and all Residents of Parkview Estate enjoying the benefits of the common infrastructure and other services provided by the Association. \n\n\ '
          '4. Annual subscriptions shall be due and valid from January till December of each year. However, residents who move into the Estate any month after June 30th of any particular year shall pay 50% of the subscription dues charged for that year. Such discounted dues shall be valid till December of that year. \n\n\ '
          ' 5. The Executive Committee may from time to time piquet the entrances into the estate in order to ensure compliance by residents with obligations under these ByLaws.',
    );
  }
}
