import 'package:flutter/material.dart';

import '../../../Reuseables/other_sidebar_temp.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return OtherTemp(
      title: 'News',
      image: 'images/news.png',
      text: 'Against the backdrop of tougher projections for the New Year, '
          'economists and allied professionals have said Nigerians could be given a soft landing with the right policy formulation, '
          'ruthless implementation, as well as a clear departure from the fiscal indiscipline that marked the previous year. From the energy sector to capital market, and maritime to labour, the economy seems to be at a crossroads. '
          'Experts, however, said there are prospects that the country’s negative trajectory could be the pivot to a clean slate to begin a new growth. The caveat is that the authorities would need to be intentional in charting the new course.'
          'They have called on President Bola Ahmed Tinubu, who will mark his first anniversary in May, to provide the much-needed exemplary leadership to steer the country from collapse and prevent the current doom loop. '
          'Already, the federal government spends almost 100 per cent of its retained revenue servicing its debt, '
          'which accounts for a larger part of the outstanding N87.9 trillion.stage for trend reversal.',
    );
  }
}

//Scaffold(
//       appBar: AppBar(title: Text('News')),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//         child: Column(
//           children: [
//             Container(
//               height: 200.h,
//               color: Colors.green,
//               child: Image.asset('images/news.png'),
//             ),
//             Text('Hello',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
//             Text(
//               'Against the backdrop of tougher projections for the New Year, '
//               'economists and allied professionals have said Nigerians could be given a soft landing with the right policy formulation, '
//               'ruthless implementation, as well as a clear departure from the fiscal indiscipline that marked the previous year. From the energy sector to capital market, and maritime to labour, the economy seems to be at a crossroads. '
//               'Experts, however, said there are prospects that the country’s negative trajectory could be the pivot to a clean slate to begin a new growth. The caveat is that the authorities would need to be intentional in charting the new course.'
//               'They have called on President Bola Ahmed Tinubu, who will mark his first anniversary in May, to provide the much-needed exemplary leadership to steer the country from collapse and prevent the current doom loop. '
//               'Already, the federal government spends almost 100 per cent of its retained revenue servicing its debt, '
//               'which accounts for a larger part of the outstanding N87.9 trillion.stage for trend reversal.',
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
