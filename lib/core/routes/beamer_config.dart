import 'package:beamer/beamer.dart';

import 'locations.dart';

class DelegateBeamer {
  static final beamerDelegate = BeamerDelegate(
    locationBuilder:
        BeamerLocationBuilder(beamLocations: BeamerLocations.beamLocations)
            .call,
    guards: [],
  );
}
