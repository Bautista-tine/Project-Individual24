List<String> getTutorialSteps(String title) {
  switch (title) {
    case 'Lavender':
      return [
        'Cut purple fuzzy wires into equal lengths.',
        'Shape each wire into small oval petals.',
        'Twist the petals together to form the flower head.',
        'Attach a green stem and wrap with floral tape.'
      ];
    case 'Tulip':
      return [
        'Prepare 3 to 4 wide fuzzy petals.',
        'Curve each petal gently.',
        'Join the petals together around a center wire.',
        'Secure with tape and shape into a tulip.'
      ];
    case 'Strawberry':
      return [
        'Make a round fuzzy red body using wire.',
        'Add green leaves on top using green pipe cleaner.',
        'Attach a brown stem at the bottom.',
        'Add yellow dots for seeds.'
      ];
    case 'Cherry':
      return [
        'Form two red fuzzy balls with wire.',
        'Connect them using a single green stem wire.',
        'Add a felt leaf on top.',
        'Adjust shape for symmetry.'
      ];
    case 'Keychain':
      return [
        'Create a small flower head using fuzzy petals.',
        'Attach a small metal loop or keyring.',
        'Add optional beads for decoration.',
        'Tighten and wrap ends cleanly.'
      ];
    default:
      return [
        'Gather your materials.',
        'Shape the wire petals.',
        'Assemble into a flower.',
        'Finish with decorative touches.'
      ];
  }
}
