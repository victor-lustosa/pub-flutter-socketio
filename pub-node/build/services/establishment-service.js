"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var establishment_1 = require("../models/establishment");
var axios = require('axios');
var key_tomtom = 'UdNRt25x7SLwYkfpwLByEYnYTCIYlUSw';
var api_tomtom = 'https://api.tomtom.com/search/';
module.exports = /** @class */ (function () {
    function Establishment_Service() {
        // establishmentList:Establishment[] = [];
        this.establishmentList = [];
    }
    Establishment_Service.prototype.find_establishment = function (data) {
        return __awaiter(this, void 0, void 0, function () {
            var _this = this;
            return __generator(this, function (_a) {
                try {
                    console.log(data.latitude);
                    console.log(data.latitude);
                    axios.get(api_tomtom + "2/nearbySearch/.json?lat=" + data.latitude + "&" +
                        ("lon=" + data.longitude + "&countrySet=BR%2C%20UTF-8&radius=5000&language=pt-BR&") +
                        ("categorySet=9376003%2C%207315039&key=" + key_tomtom)).
                        then(function (response) {
                        for (var index = 0; index < response.data.length; index++) {
                            _this.establishmentList.push(new establishment_1.Establishment(response[index]['poi']['name'], response[index]['position']['lat'], response[index]['position']['lon']));
                            console.log(_this.establishmentList);
                        }
                        // this.establishmentList = response as Establishment[]
                    }).catch(function (error) {
                        console.log(error);
                    });
                    // const response =  new establishment(new_todo).save();
                    return [2 /*return*/, this.establishmentList];
                }
                catch (e) {
                    console.log("Erro: " + e);
                }
                return [2 /*return*/];
            });
        });
    };
    return Establishment_Service;
}());
