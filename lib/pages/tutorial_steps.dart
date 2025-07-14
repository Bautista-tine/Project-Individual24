// tutorial_steps.dart

// Mutable maps holding tutorial steps and materials for each flower.
Map<String, List<String>> tutorialSteps = {
  'Lavender': [
    'Twist 2–3 purple pipe cleaners together into a long, slightly curved shape (like a lavender spike).',
    'Lightly bend and separate the fibers to make it look fuller and more realistic.',
    'Wrap one end of the flower with green floral wire or a green pipe cleaner to form a stem.',
    'Twist the green wire tightly around the base of the purple spike.',
    'Slightly curve the stem and adjust the fuzzy parts for a natural look.',
  ],
  'Sunflower': [
    'Coil a brown pipe cleaner into a flat spiral (like a cinnamon roll) for the sunflower center.',
    'Take yellow pipe cleaners and bend each into a petal shape (oval loop). Make 6–8 petals.',
    'Twist the ends of each petal around the edge of the brown spiral center.',
    'Use a green pipe cleaner and twist it onto the back of the brown center as the stem.',
    'Shape green pipe cleaners into leaf forms and attach them to the stem.',
  ],
  'lily': [
    'Shape 5–6 white or pink pipe cleaners into long teardrop-shaped loops for lily petals.',
    'Twist all the petal ends together at the base, fanning them out like a star.',
    'Cut a yellow pipe cleaner into 2–3 short pieces. Bend the tips and bunch them together, then twist their base and insert it in the middle of the petals.',
    'Twist a green pipe cleaner around the base of the petals to act as the stem.',
    'Use extra green pipe cleaners to make long, narrow leaves and attach them to the stem.',
  ],
  'Tulip': [
    'Take 3–4 red/pink/purple pipe cleaners.',
    'Bend each into a tall U-shape (like a petal).',
    'Bundle and twist them together at the bottom to form a closed tulip bud.',
    'Gently spread the tops of the petals outward to make them look like a real tulip.',
    'Twist a green pipe cleaner tightly around the base of the petals to form the stem.',
    'Shape a separate green pipe cleaner into a long, curved leaf and twist it around the stem.',
  ],
  'Strawberry': [
    'Take the red fuzzy wire and coil it into a cone shape — wider at the base and narrower at the top. Secure the end by twisting it.',
    'Lightly glue on small black beads or use a black marker to add seed dots around the strawberry.',
    'Cut a short piece of green fuzzy wire. Bend it into 2–3 tiny loops to form leaves and twist them together at the base.',
    'Attach another small piece of green fuzzy wire to the leaves and twist it upward to act as the stem.',
    'Twist the stem tightly around the keyring to secure the strawberry. Adjust the shape if needed.',
  ],
  'Ribbon':[
    'Cut two fuzzy wires of equal length (about 6 inches each).',
    'Form the ribbon shape by folding each wire into a loop (like the two loops of a ribbon), and twist the center to hold the loops.',
    'Twist the second wire into a bow tail shape and attach it to the back of the ribbon loops.',
    'Secure the center with a short piece of fuzzy wire, wrapping it tightly to hold the bow together.',
    'Attach the keyring by twisting the excess wire through the ring and wrapping it firmly.',
    '(Optional) Add decorations like beads or glue on tiny gems to the ribbon for extra flair.',
  ],
  'Cherry': [
    'Roll each red fuzzy wire into a tight ball to form a cherry. Twist the end to secure.',
    'Fold the green fuzzy wire in half. Twist the middle part together, leaving both ends free to attach the cherries.',
    'Twist one cherry to each loose end of the green stem wire. Adjust so they sit close together like real cherries.',
    'Shape a small leaf with the remaining green wire by bending it into an oval and twisting it at the base.'
    'Twist the top of the green stem wire around your keyring tightly. Use pliers if needed to secure firmly.',
  ],
  'Petal Flower': [
    'Create a small flower head using fuzzy petals.',
    'Attach a small metal loop or keyring.',
    'Add optional beads for decoration.',
    'Tighten and wrap ends cleanly.',
  ],
  'Rose': [
    'Take the red fuzzy wire and roll one end into a tight spiral — this is the center of your rose.',
    'Keep wrapping the wire around the center spiral loosely to form rose petals. Adjust the shape as you go.',
    'Attach the green fuzzy wire to the base of the rose by twisting it securely.',
    'Fold part of the green wire into a leaf shape on one or both sides, then twist it to secure.',
    'Adjust the shape, trim any excess, and bend the stem slightly for a natural look.',
  ],
  'Lily of the Valley': [
    'Take a white fuzzy wire, form a small loop (like a teardrop), and twist the ends to secure. Slightly pinch the top to resemble a bell. Repeat 3–5 times.',
    'Take the green fuzzy wire and slightly bend it into a gentle curve (like a hook or cane).',
    'Twist the base of each white bell flower around the green stem at intervals, starting from the top.',
    'Cut and glue a leaf shape using green paper or bend a green fuzzy wire into a leaf shape and attach it near the bottom.',
    'Space out the bell flowers and adjust the curve of the stem to resemble a natural Lily of the Valley.',
    ]
};

Map<String, List<String>> tutorialMaterials = {
  'Lavender': [
    'Purple fuzzy wires',
    'Green stem wire',
    'Floral tape',
    'Scissors',
  ],
  'Sunflower': [
    'Yellow fuzzy wires (5 to 10)',
    'Brown center fuzzy wire',
    'Green stem wire',
    'Tape',
    'Scissors',
  ],
  'lily': [
    'White fuzzy wires',
    'Yellow center wire',
    'Floral tape',
    'Scissors',
  ],
  'Tulip': [
    'Wide fuzzy wires (3 to 4)',
    'Center wire',
    'Tape',
    'Scissors',
  ],
  'Strawberry': [
    '1 red fuzzy wire (for the strawberry body)',
    '1 green fuzzy wire (for leaves and stem)',
    '1 keyring',
    'Optional: small black beads or black marker (for seeds)',
  ],
  'Ribbon': [
    'Red or pink fuzzy wires (pipe cleaners)',
    'A small keyring',
    'Glue (optional, for securing)',
    'Beads or gems (optional for decoration)',
    'Scissors'
  ],
  'Cherry': [
    '2 red fuzzy wires (for the cherries)',
    '1 green fuzzy wire (for stem and leaf)',
    '1 keyring',
    'Scissors',
    'Small pliers (optional for twisting)',
  ],
  'Petal Flower': [
    'Colored fuzzy wires',
    'Keyring',
    'Glue or beads',
    'Tape or thread',
  ],
  'Rose': [
    'Red fuzzy wire',
    'Green fuzzy wire',
    'Green stem wire',
    'Scissors',
  ],
  'Lily of the Valley': [
    '1 green fuzzy wire (for the stem)',
    '3–5 white fuzzy wires (for the bell-shaped flowers)',
    'Optional: green paper or felt (for leaves)',
    'Glue or small twist ties (optional for stability)',
  ],
};

// Getter functions that safely return an empty list if no data exists
List<String> getTutorialSteps(String title) => tutorialSteps[title] ?? [];
List<String> getTutorialMaterials(String title) => tutorialMaterials[title] ?? [];
