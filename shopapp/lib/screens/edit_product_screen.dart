import 'dart:ffi';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/product.dart';
import '../provider/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final pricefocusNode = FocusNode();
  final descptionfocusode = FocusNode();
  final imageUrlFocusNode = FocusNode();
  final imageUrlCotroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '',
    title: '',
    description: '',
    imageUrl: '',
    price: 0,
  );
  var _initStte = {'title': '', 'description': '', 'price': '', 'imageUrl': ''};
  @override
  Void? dispose() {
    pricefocusNode.dispose();
    descptionfocusode.dispose();
    imageUrlCotroller.dispose();
    imageUrlFocusNode.removeListener(_updateImageUrl);

    super.dispose();
  }

  void _updateImageUrl() {
    if (!imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void initState() {
    imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _saveForm() {
    _form.currentState!.save();

    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);

    Navigator.of(context).pop();
  }

  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;

      _editedProduct =
          Provider.of<Products>(context, listen: false).findById(productId);
      _initStte = {
        'title': _editedProduct.title,
        'description': _editedProduct.description,
        'price': _editedProduct.price.toString(),
        'imageUrl': '',
      };
      imageUrlCotroller.text = _editedProduct.imageUrl;

      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Screen'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            TextFormField(
              initialValue: _initStte['title'],
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(pricefocusNode),
              onSaved: (Value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: Value!,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price);
              },
            ),
            TextFormField(
              initialValue: _initStte['price'],
              focusNode: pricefocusNode,
              decoration: InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(descptionfocusode),
              onSaved: (Value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                    price: double.parse(Value!));
              },
            ),
            TextFormField(
              initialValue: _initStte['descripton'],
              focusNode: descptionfocusode,
              decoration: InputDecoration(labelText: 'description'),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              onSaved: (Value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                    title: _editedProduct.title,
                    description: Value!,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price);
              },
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  child: imageUrlCotroller.text.isEmpty
                      ? Text('enter url')
                      : FittedBox(
                          child: Image.network(
                            imageUrlCotroller.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'image url'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: imageUrlCotroller,
                    focusNode: imageUrlFocusNode,
                    onSaved: (Value) {
                      _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          imageUrl: Value!,
                          price: _editedProduct.price);
                    },
                    onFieldSubmitted: (_) => _saveForm(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
