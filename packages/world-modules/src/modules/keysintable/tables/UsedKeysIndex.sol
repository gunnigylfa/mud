// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("UsedKeysIndex")))
);
ResourceId constant UsedKeysIndexTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0006020001050000000000000000000000000000000000000000000000000000
);

library UsedKeysIndex {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](2);
    _keySchema[0] = SchemaType.BYTES32;
    _keySchema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.BOOL;
    _valueSchema[1] = SchemaType.UINT40;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "sourceTableId";
    keyNames[1] = "keysHash";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "has";
    fieldNames[1] = "index";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get has */
  function getHas(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Get has */
  function _getHas(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Get has (using the specified store) */
  function getHas(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Set has */
  function setHas(ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /** Set has */
  function _setHas(ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /** Set has (using the specified store) */
  function setHas(IStore _store, ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /** Get index */
  function getIndex(ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /** Get index */
  function _getIndex(ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /** Get index (using the specified store) */
  function getIndex(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /** Set index */
  function setIndex(ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /** Set index */
  function _setIndex(ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /** Set index (using the specified store) */
  function setIndex(IStore _store, ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /** Get the full data */
  function get(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data */
  function _get(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Get the full data (using the specified store) */
  function get(
    IStore _store,
    ResourceId sourceTableId,
    bytes32 keysHash
  ) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = _store.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function set(ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /** Set the full data using individual values */
  function _set(ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * Decode the tightly packed blob of static data using this table's field layout
   * Undefined behaviour for invalid blobs
   */
  function decodeStatic(bytes memory _blob) internal pure returns (bool has, uint40 index) {
    has = (_toBool(uint8(Bytes.slice1(_blob, 0))));

    index = (uint40(Bytes.slice5(_blob, 1)));
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (bool has, uint40 index) {
    (has, index) = decodeStatic(_staticData);
  }

  /** Delete all data for given keys */
  function deleteRecord(ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /** Delete all data for given keys */
  function _deleteRecord(ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(bool has, uint40 index) internal pure returns (bytes memory) {
    return abi.encodePacked(has, index);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bool has, uint40 index) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(ResourceId sourceTableId, bytes32 keysHash) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    return _keyTuple;
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}