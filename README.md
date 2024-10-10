# Flutter SearchViewDelegate with Highlighted Results

This Flutter application demonstrates an efficient and user-friendly search functionality using a custom `SearchViewDelegate`. The app is designed to handle large datasets with ease, providing a smooth search experience even with extensive lists.

## Features

- **Fast Search**: Efficiently searches through large datasets (tested with 70,000 entries).
- **Highlighted Results**: Search query matches are highlighted in the results for better visibility.
- **Case-Insensitive Search**: Matches are found regardless of letter case.
- **Real-Time Updates**: Results update as the user types.
- **Clear Button**: Easily clear the search query with a single tap.
- **Customizable**: The search delegate can be easily integrated and customized for various applications.


https://github.com/user-attachments/assets/fe1d7f11-dd08-4835-ba4e-6c2199693d38


## Performance

This implementation has been tested with a dataset of approximately 70,000 strings, each 28 characters in length. Despite the large volume of data, the search functionality remains responsive and efficient.

## How It Works

The `SearchViewDelegate` class extends Flutter's `SearchDelegate` to provide custom search functionality:

1. As the user types a query, the `buildSuggestions` method filters the data in real-time.
2. The filtered results are displayed in a `ListView`.
3. Each result is rendered using `RichText` to highlight the matching portions of the text.
4. The `_highlightOccurrences` method splits the text and applies different styles to matching and non-matching parts.

## Usage

To use this `SearchViewDelegate` in your Flutter app:

1. Copy the `SearchViewDelegate` class into your project.
2. Initialize it with your data:

```dart
final List<String> myData = [...]; // Your large dataset
final searchDelegate = SearchViewDelegate(data: myData);
```

3. Show the search delegate when needed:

```dart
showSearch(
  context: context,
  delegate: searchDelegate,
);
```

## Customization

You can easily customize the appearance of the search results by modifying the `TextStyle` in the `_highlightOccurrences` method. Additionally, you can adjust the `buildLeading` and `buildActions` methods to change the appearance of the search bar itself.

## Contributing

Contributions to improve the efficiency or functionality of this search implementation are welcome. Please feel free to submit issues or pull requests.

Feel free to star this repository if you find it useful, and don't hesitate to reach out with any questions or suggestions!
