class WooCategories {
  int id;
  String name;
  String slug;
  int parent;
  String description;
  String display;
  Image image;
  int menuOrder;
  int count;
  Links lLinks;

  WooCategories(
      {id,
      name,
      slug,
      parent,
      description,
      display,
      image,
      menuOrder,
      count,
      lLinks});

  WooCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    menuOrder = json['menu_order'];
    count = json['count'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent'] = parent;
    data['description'] = description;
    data['display'] = display;
    if (image != null) {
      data['image'] = image.toJson();
    }
    data['menu_order'] = menuOrder;
    data['count'] = count;
    if (lLinks != null) {
      data['_links'] = lLinks.toJson();
    }
    return data;
  }
}

class Image {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String src;
  String name;
  String alt;

  Image(
      {id,
      dateCreated,
      dateCreatedGmt,
      dateModified,
      dateModifiedGmt,
      src,
      name,
      alt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['src'] = src;
    data['name'] = name;
    data['alt'] = alt;
    return data;
  }
}

class Links {
  List<Self> self;

  Links({self});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self.add(Self.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
