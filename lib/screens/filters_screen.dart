import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNamed = '/settings';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegeterian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten'];
    vegeterian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];
    lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegeterian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten Free',
                  'Only include gluten free',
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Only include lactose free',
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  'Only vegeterian',
                  vegeterian,
                  (newValue) {
                    setState(() {
                      vegeterian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only vegan',
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
