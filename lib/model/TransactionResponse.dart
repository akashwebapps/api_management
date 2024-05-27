class TransactionResponse {
  bool? success;
  String? message;
  List<CardTransactions>? cardTransactions;
  Pagination? pagination;

  TransactionResponse(
      {this.success, this.message, this.cardTransactions, this.pagination});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['cardTransactions'] != null) {
      cardTransactions = <CardTransactions>[];
      json['cardTransactions'].forEach((v) {
        cardTransactions!.add(new CardTransactions.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.cardTransactions != null) {
      data['cardTransactions'] =
          this.cardTransactions!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class CardTransactions {
  String? sId;
  String? paymentId;
  String? userId;
  String? paymentMethod;
  int? price;
  int? coinAmount;
  String? currency;
  String? description;
  String? createdAt;
  String? transactionType;
  TransactionWith? transactionWith;
  String? fileUrl;
  NftPurchases? nftPurchases;
  String? id;

  CardTransactions(
      {this.sId,
      this.paymentId,
      this.userId,
      this.paymentMethod,
      this.price,
      this.coinAmount,
      this.currency,
      this.description,
      this.createdAt,
      this.transactionType,
      this.transactionWith,
      this.fileUrl,
      this.nftPurchases,
      this.id});

  CardTransactions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    paymentId = json['paymentId'];
    userId = json['user_id'];
    paymentMethod = json['payment_method'];
    price = json['price'];
    coinAmount = json['coinAmount'];
    currency = json['currency'];
    description = json['description'];
    createdAt = json['createdAt'];
    transactionType = json['transactionType'];
    transactionWith = json['transactionWith'] != null
        ? new TransactionWith.fromJson(json['transactionWith'])
        : null;
    fileUrl = json['fileUrl'];
    nftPurchases = json['Nft_purchases'] != null
        ? new NftPurchases.fromJson(json['Nft_purchases'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['paymentId'] = this.paymentId;
    data['user_id'] = this.userId;
    data['payment_method'] = this.paymentMethod;
    data['price'] = this.price;
    data['coinAmount'] = this.coinAmount;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['transactionType'] = this.transactionType;
    if (this.transactionWith != null) {
      data['transactionWith'] = this.transactionWith!.toJson();
    }
    data['fileUrl'] = this.fileUrl;
    if (this.nftPurchases != null) {
      data['Nft_purchases'] = this.nftPurchases!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class TransactionWith {
  NickName? nickName;
  String? sId;
  String? name;
  String? userName;
  String? id;

  TransactionWith({this.nickName, this.sId, this.name, this.userName, this.id});

  TransactionWith.fromJson(Map<String, dynamic> json) {
    nickName = json['nickName'] != null
        ? new NickName.fromJson(json['nickName'])
        : null;
    sId = json['_id'];
    name = json['name'];
    userName = json['userName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nickName != null) {
      data['nickName'] = this.nickName!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['id'] = this.id;
    return data;
  }
}

class NickName {
  String? fName;
  String? lName;

  NickName({this.fName, this.lName});

  NickName.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    return data;
  }
}

class NftPurchases {
  String? sId;
  Nft? nft;
  TransactionWith? seller;
  TransactionWith? buyer;
  String? payment;

  NftPurchases({this.sId, this.nft, this.seller, this.buyer, this.payment});

  NftPurchases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nft = json['nft'] != null ? new Nft.fromJson(json['nft']) : null;
    seller = json['seller'] != null
        ? new TransactionWith.fromJson(json['seller'])
        : null;
    buyer = json['buyer'] != null
        ? new TransactionWith.fromJson(json['buyer'])
        : null;
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.nft != null) {
      data['nft'] = this.nft!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    if (this.buyer != null) {
      data['buyer'] = this.buyer!.toJson();
    }
    data['payment'] = this.payment;
    return data;
  }
}

class Nft {
  String? sId;
  String? fileUrl;
  String? nFTIdentity;
  String? layout;

  Nft({this.sId, this.fileUrl, this.nFTIdentity, this.layout});

  Nft.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fileUrl = json['fileUrl'];
    nFTIdentity = json['NFT_identity'];
    layout = json['layout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fileUrl'] = this.fileUrl;
    data['NFT_identity'] = this.nFTIdentity;
    data['layout'] = this.layout;
    return data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? totalPage;
  int? totalRows;

  Pagination({this.page, this.limit, this.totalPage, this.totalRows});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    totalPage = json['totalPage'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPage'] = this.totalPage;
    data['totalRows'] = this.totalRows;
    return data;
  }
}
