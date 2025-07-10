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
    'Make a round fuzzy red body using wire.',
    'Add green leaves on top using green pipe cleaner.',
    'Attach a brown stem at the bottom.',
    'Add yellow dots for seeds.',
  ],
  'Cherry': [
    'Form two red fuzzy balls with wire.',
    'Connect them using a single green stem wire.',
    'Add a felt leaf on top.',
    'Adjust shape for symmetry.',
  ],
  'petal flower': [
    'Create a small flower head using fuzzy petals.',
    'Attach a small metal loop or keyring.',
    'Add optional beads for decoration.',
    'Tighten and wrap ends cleanly.',
  ],
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
    'Red fuzzy wire',
    'Green pipe cleaner',
    'Yellow paint or dots',
  ],
  'Cherry': [
    'Red fuzzy wires',
    'Green stem wire',
    'Felt leaf',
    'Scissors',
  ],
  'petal flower': [
    'Colored fuzzy wires',
    'Keyring',
    'Glue or beads',
    'Tape or thread',
  ],
};

// Getter functions that safely return an empty list if no data exists
List<String> getTutorialSteps(String title) => tutorialSteps[title] ?? [];
List<String> getTutorialMaterials(String title) => tutorialMaterials[title] ?? [];
