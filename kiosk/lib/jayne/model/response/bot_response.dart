class BotResponse {
  String? output;
  List<RetrievedReferences>? retrievedReferences;

  BotResponse({this.output, this.retrievedReferences});

  BotResponse.fromJson(Map<String, dynamic> json) {
    output = json['output'];
    if (json['retrieved_references'] != null) {
      retrievedReferences = <RetrievedReferences>[];
      json['retrieved_references'].forEach((v) {
        retrievedReferences!.add(RetrievedReferences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['output'] = output;
    if (retrievedReferences != null) {
      data['retrieved_references'] = retrievedReferences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RetrievedReferences {
  String? content;
  Metadata? metadata;

  RetrievedReferences({
    this.content,
    this.metadata,
  });

  RetrievedReferences.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  String? code;
  int? discount;
  int? discountValue;
  int? discountedPrice;
  String? image0;
  String? image1;
  String? image2;
  int? originalPrice;
  int? point;
  String? productUrl;
  String? xAmzBedrockKbChunkId;
  String? xAmzBedrockKbDataSourceId;
  String? xAmzBedrockKbSourceUri;

  Metadata({
    this.code,
    this.discount,
    this.discountValue,
    this.discountedPrice,
    this.image0,
    this.image1,
    this.image2,
    this.originalPrice,
    this.point,
    this.productUrl,
    this.xAmzBedrockKbChunkId,
    this.xAmzBedrockKbDataSourceId,
    this.xAmzBedrockKbSourceUri,
  });

  Metadata.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    discount = json['discount_%'];
    discountValue = json['discount_value'];
    discountedPrice = json['discounted_price'];
    image0 = json['image_0'];
    image1 = json['image_1'];
    image2 = json['image_2'];
    originalPrice = json['original_price'];
    point = json['point'];
    productUrl = json['product_url'];
    xAmzBedrockKbChunkId = json['x-amz-bedrock-kb-chunk-id'];
    xAmzBedrockKbDataSourceId = json['x-amz-bedrock-kb-data-source-id'];
    xAmzBedrockKbSourceUri = json['x-amz-bedrock-kb-source-uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['discount_%'] = discount;
    data['discount_value'] = discountValue;
    data['discounted_price'] = discountedPrice;
    data['image_0'] = image0;
    data['image_1'] = image1;
    data['image_2'] = image2;
    data['original_price'] = originalPrice;
    data['point'] = point;
    data['product_url'] = productUrl;
    data['x-amz-bedrock-kb-chunk-id'] = xAmzBedrockKbChunkId;
    data['x-amz-bedrock-kb-data-source-id'] = xAmzBedrockKbDataSourceId;
    data['x-amz-bedrock-kb-source-uri'] = xAmzBedrockKbSourceUri;
    return data;
  }
}
