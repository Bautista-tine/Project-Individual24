List<String> getTutorialSteps(String title) {
  switch (title) {
    case 'Lavender':
      return [
        'Cut purple fuzzy wires into equal lengths.',
        'Shape each wire into small oval petals.',
        'Twist the petals together to form the flower head.',
        'Attach a green stem and wrap with floral tape.',
      ];
    case 'Sunflower':
      return [
        'Prepare 5 to 10 yellow fuzzy petals.',
        'Curve each petal gently outward.',
        'Join the petals around a thick brown fuzzy center.',
        'Secure with green stem and wrap with tape.',
      ];
    case 'lily':
      return [
        'Cut white fuzzy wires into long petals.',
        'Form each into a curved shape.',
        'Bundle petals around a yellow center.',
        'Wrap the base with green floral tape.',
      ];
    case 'Tulip':
      return [
        'Prepare 3 to 4 wide fuzzy petals.',
        'Curve each petal gently.',
        'Join the petals together around a center wire.',
        'Secure with tape and shape into a tulip.',
      ];
    case 'Strawberry':
      return [
        'Make a round fuzzy red body using wire.',
        'Add green leaves on top using green pipe cleaner.',
        'Attach a brown stem at the bottom.',
        'Add yellow dots for seeds.',
      ];
    case 'Cherry':
      return [
        'Form two red fuzzy balls with wire.',
        'Connect them using a single green stem wire.',
        'Add a felt leaf on top.',
        'Adjust shape for symmetry.',
      ];
    case 'Keychain':
      return [
        'Create a small flower head using fuzzy petals.',
        'Attach a small metal loop or keyring.',
        'Add optional beads for decoration.',
        'Tighten and wrap ends cleanly.',
      ];
    default:
      return [
        'Gather your materials.',
        'Shape the wire petals.',
        'Assemble into a flower.',
        'Finish with decorative touches.',
      ];
  }
}

List<String> getTutorialMaterials(String title) {
  switch (title) {
    case 'Lavender':
      return [
        'Purple fuzzy wires',
        'Green stem wire',
        'Floral tape',
        'Scissors',
      ];
    case 'Sunflower':
      return [
        'Yellow fuzzy wires (5 to 10)',
        'Brown center fuzzy wire',
        'Green stem wire',
        'Tape',
        'Scissors',
      ];
    case 'lily':
      return [
        'White fuzzy wires',
        'Yellow center wire',
        'Floral tape',
        'Scissors',
      ];
    case 'Tulip':
      return [
        'Wide fuzzy wires (3 to 4)',
        'Center wire',
        'Tape',
        'Scissors',
      ];
    case 'Strawberry':
      return [
        'Red fuzzy wire',
        'Green pipe cleaner',
        'Yellow paint or dots',
      ];
    case 'Cherry':
      return [
        'Red fuzzy wires',
        'Green stem wire',
        'Felt leaf',
        'Scissors',
      ];
    case 'Keychain':
      return [
        'Colored fuzzy wires',
        'Keyring',
        'Glue or beads',
        'Tape or thread',
      ];
    default:
      return [
        'Wires',
        'Tape',
        'Scissors',
      ];
  }
}

List<String> getTutorialStepImages(String title) {
  switch (title) {
    case 'Lavender':
      return [
        'assets/Lavender/step1.jpg',
        'assets/Lavender/step2.jpg',
        'assets/Lavender/step3.jpg',
        'assets/Lavender/step4.jpg',
      ];
    case 'Sunflower':
      return [
        'assets/Sunflower/step1.jpg',
        'assets/Sunflower/step2.jpg',
        'assets/Sunflower/step3.jpg',
        'assets/Sunflower/step4.jpg',
      ];
    case 'lily':
      return [
        'assets/Lily/step1.jpg',
        'assets/Lily/step2.jpg',
        'assets/Lily/step3.jpg',
        'assets/Lily/step4.jpg',
      ];
    case 'Tulip':
      return [
        'assets/Tulip/step1.jpg',
        'assets/Tulip/step2.jpg',
        'assets/Tulip/step3.jpg',
        'assets/Tulip/step4.jpg',
      ];
    case 'Strawberry':
      return [
        'assets/Strawberry/step1brry.png',
        'assets/Strawberry/step2brry.png',
        'assets/Strawberry/step3brry.png',
      ];
    case 'Cherry':
      return [
        'assets/Cherry/step1.jpg',
        'assets/Cherry/step2.jpg',
        'assets/Cherry/step3.jpg',
        'assets/Cherry/step4.jpg',
      ];
    case 'Keychain':
      return [
        'assets/Keychain/step1.jpg',
        'assets/Keychain/step2.jpg',
        'assets/Keychain/step3.jpg',
        'assets/Keychain/step4.jpg',
      ];
    default:
      return [
        'assets/default_step.jpg',
        'assets/default_step.jpg',
        'assets/default_step.jpg',
        'assets/default_step.jpg',
      ];
  }
}
