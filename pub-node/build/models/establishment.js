"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Establishment = void 0;
var Establishment = /** @class */ (function () {
    function Establishment(nameConstructor, latitudeConstructor, longitudeConstructor) {
        this.nameConstructor = nameConstructor;
        this.latitudeConstructor = latitudeConstructor;
        this.longitudeConstructor = longitudeConstructor;
        this.name = nameConstructor;
        this.latitude = latitudeConstructor;
        this.longitude = longitudeConstructor;
    }
    return Establishment;
}());
exports.Establishment = Establishment;
