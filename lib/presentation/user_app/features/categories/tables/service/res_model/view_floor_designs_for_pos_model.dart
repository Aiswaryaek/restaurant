// To parse this JSON data, do
//
//     final viewFloorDesignForPosResModel = viewFloorDesignForPosResModelFromJson(jsonString);

import 'dart:convert';

ViewFloorDesignForPosResModel viewFloorDesignForPosResModelFromJson(String str) => ViewFloorDesignForPosResModel.fromJson(json.decode(str));

String viewFloorDesignForPosResModelToJson(ViewFloorDesignForPosResModel data) => json.encode(data.toJson());

class ViewFloorDesignForPosResModel {
    dynamic id;
    String? nameOfFloor;
    String? color;
    bool? seatSelection;
    List<FloorCanva>? floorCanvas;

    ViewFloorDesignForPosResModel({
        this.id,
        this.nameOfFloor,
        this.color,
        this.seatSelection,
        this.floorCanvas,
    });

    factory ViewFloorDesignForPosResModel.fromJson(Map<String, dynamic> json) => ViewFloorDesignForPosResModel(
        id: json["_id"],
        nameOfFloor: json["nameOfFloor"],
        color: json["color"],
        seatSelection: json["seatSelection"],
        floorCanvas: json["floorCanvas"] == null ? [] : List<FloorCanva>.from(json["floorCanvas"]!.map((x) => FloorCanva.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nameOfFloor": nameOfFloor,
        "color": color,
        "seatSelection": seatSelection,
        "floorCanvas": floorCanvas == null ? [] : List<dynamic>.from(floorCanvas!.map((x) => x.toJson())),
    };
}

class FloorCanva {
    dynamic type;
    String? id;
    int? transNo;
    dynamic floorId;
    String? name;
    String? structure;
    Size? size;
    Position? position;
    String? color;
    int? v;
    dynamic orderId;
    String? tableId;

    FloorCanva({
        this.type,
        this.id,
        this.transNo,
        this.floorId,
        this.name,
        this.structure,
        this.size,
        this.position,
        this.color,
        this.v,
        this.orderId,
        this.tableId,
    });

    factory FloorCanva.fromJson(Map<String, dynamic> json) => FloorCanva(
        type: json["type"],
        id: json["_id"],
        transNo: json["transNo"],
        floorId: json["floorId"],
        name: json["name"],
        structure: json["structure"],
        size: json["size"] == null ? null : Size.fromJson(json["size"]),
        position: json["position"] == null ? null : Position.fromJson(json["position"]),
        color: json["color"],
        v: json["__v"],
        orderId: json["orderId"],
        tableId: json["tableId"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "_id": id,
        "transNo": transNo,
        "floorId": floorId,
        "name": name,
        "structure": structure,
        "size": size?.toJson(),
        "position": position?.toJson(),
        "color": color,
        "__v": v,
        "orderId": orderId,
        "tableId": tableId,
    };
}



class Position {
    double? x;
    double? y;

    Position({
        this.x,
        this.y,
    });

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

class Size {
    int? width;
    int? height;

    Size({
        this.width,
        this.height,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
    };
}



