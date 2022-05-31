//SPDX-License-Identifier: GPL-3.0;

pragma solidity 0.8.7;

contract Ecommerce{

    struct Product{
        string title;
        string desc;
        address payable seller;
        uint productId;
        uint price;
        address buyer;
        bool delivered;
    }
    Product[] public Products;
    uint count = 1;
    event register(string title, uint productId, address seller);
    event bought (uint productId, address buyer);
    event delivered (uint productId);


    function RegisterProduct(string memory _title,string memory _desc,uint _price) public{
        require(_price > 0,"please put complete price");
        Product memory tempProduct;
        tempProduct.title = _title;
        tempProduct.desc = _desc;
        tempProduct.price = _price * 10 **18;
        tempProduct.seller =payable(msg.sender);
        tempProduct.productId = count;
        Products.push(tempProduct);
        count++;

        emit register(_title, tempProduct.productId , msg.sender);

    }
    function buyProduct(uint _productId) payable public{
        require(Products[_productId -1].price == msg.value,"kindly Pay full amount");
        require(Products[_productId-1].seller == msg.sender,"seller can't buy");
        Products[_productId-1].buyer == msg.sender;


        emit bought(_productId,msg.sender);

    }

    function delivery(uint _productId) public {
        require(Products[_productId-1].buyer ==msg.sender, "you can'y buy");
        Products[_productId-1].delivered == true;
        Products[_productId-1].seller.transfer(Products[_productId-1].price);


        emit delivered(_productId);
    }



}







again copy paste //
//SPDX-License-Identifier: GPL-3.0;

pragma solidity 0.8.7;

contract Ecommerce{

    struct Product{
        string title;
        string desc;
        address payable seller;
        uint productId;
        uint price;
        address buyer;
        bool delivered;
    }
    Product[] public Products;
    uint count = 1;
    event register(string title, uint productId, address seller);
    event bought (uint productId, address buyer);
    event delivered (uint productId);


    function RegisterProduct(string memory _title,string memory _desc,uint _price) public{
        require(_price > 0,"please put complete price");
        Product memory tempProduct;
        tempProduct.title = _title;
        tempProduct.desc = _desc;
        tempProduct.price = _price * 10 **18;
        tempProduct.seller =payable(msg.sender);
        tempProduct.productId = count;
        Products.push(tempProduct);
        count++;

        emit register(_title, tempProduct.productId , msg.sender);

    }
    function buyProduct(uint _productId) payable public{
        require(Products[_productId -1].price == msg.value,"kindly Pay full amount");
        require(Products[_productId-1].seller == msg.sender,"seller can't buy");
        Products[_productId-1].buyer == msg.sender;


        emit bought(_productId,msg.sender);

    }

    function delivery(uint _productId) public {
        require(Products[_productId-1].buyer ==msg.sender, "you can'y buy");
        Products[_productId-1].delivered == true;
        Products[_productId-1].seller.transfer(Products[_productId-1].price);


        emit delivered(_productId);
    }

}
