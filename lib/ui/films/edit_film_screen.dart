import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/film.dart';
import '../shared/dialog_utils.dart';
import 'films_manager.dart';

class EditFilmScreen extends StatefulWidget {
  static const routeName = '/edit-film';
  EditFilmScreen(Film? film, {super.key}) {
    if (film == null) {
      this.film = Film(
        id: null,
        name: '',
        title: '',
        writer: '',
        pubDate: '',
        lastDate: '',
        description: '',
        content: '',
        imageUrl: '',
        type: '',
      );
    } else {
      this.film = film;
    }
  }
  late final Film film;

  @override
  State<EditFilmScreen> createState() => _EditFilmScreenState();
}

class _EditFilmScreenState extends State<EditFilmScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Film _editedFilm;
  var _isLoading = false;
  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        // Ảnh họp lệ -> Vẽ lại màn hình để preview
        setState(() {});
      }
    });
    _editedFilm = widget.film;
    _imageUrlController.text = _editedFilm.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final filmsManager = context.read<FilmsManager>();
      if (_editedFilm.id != null) {
        // await
        // filmsManager.updateFilm(_editedFilm);
        await filmsManager.updateFilm(_editedFilm);
      } else {
        // await
        // filmsManager.addFilm(_editedFilm);
        await filmsManager.addFilm(_editedFilm);
      }
    } catch (error) {
      await showErrorDialog(context, 'Something went wrong.');
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Film'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildNameField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildTitleField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildWriterField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildPubDateField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildLastDateField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildDescriptionField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildContentField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildTypeField(),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    buildProductPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedFilm.name,
      decoration: const InputDecoration(
        labelText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provider a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(name: value);
      },
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedFilm.title,
      decoration: const InputDecoration(
        labelText: 'Title',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provider a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(title: value);
      },
    );
  }

  TextFormField buildWriterField() {
    return TextFormField(
      initialValue: _editedFilm.writer,
      decoration: const InputDecoration(
        labelText: 'Write',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provider a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(writer: value);
      },
    );
  }

  TextFormField buildPubDateField() {
    return TextFormField(
      initialValue: _editedFilm.pubDate,
      decoration: const InputDecoration(
        labelText: 'PubDate',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provider a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(pubDate: value);
      },
    );
  }

  TextFormField buildLastDateField() {
    return TextFormField(
      initialValue: _editedFilm.lastDate,
      decoration: const InputDecoration(
        labelText: 'LastDate',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provider a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(lastDate: value);
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedFilm.description,
      decoration: const InputDecoration(
        labelText: 'Description',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please proviDer a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(description: value);
      },
    );
  }

  TextFormField buildContentField() {
    return TextFormField(
      initialValue: _editedFilm.content,
      decoration: const InputDecoration(
        labelText: 'Content',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please proviDer a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(content: value);
      },
    );
  }

  TextFormField buildTypeField() {
    return TextFormField(
      initialValue: _editedFilm.type,
      decoration: const InputDecoration(
        labelText: 'Type Film',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please proviDer a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(type: value);
      },
    );
  }

  Widget buildProductPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Text('Enter a URL')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(
          child: buildImageURLField(),
        ),
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Image URL',
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        // border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL.';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter a valid image URL.';
        }
        return null;
      },
      onSaved: (value) {
        _editedFilm = _editedFilm.copyWith(imageUrl: value);
      },
    );
  }
}
