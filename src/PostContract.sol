// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostContract {
    struct Post {
        address poster;
        string title;
        string content;
    }

    Post[] public posts;

    event PostUploaded(address indexed poster, string title, string content);

    /*//////////////////////////////////////////////////////////////
                           EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    function postContent(bytes memory data) external {
        Post memory postToBeUploaded = abi.decode(data, (Post));
        posts.push(postToBeUploaded);
        emit PostUploaded(
            postToBeUploaded.poster,
            postToBeUploaded.title,
            postToBeUploaded.content
        );
    }

    // this function is used to generate the data to be passed to the postContent function
    // for simplicity, just encode the poster, title, and content
    // when validating the data, just check if all the fields are not empty
    function generatePostData(
        string memory title,
        string memory content
    ) external view returns (bytes memory) {
        Post memory newPost = Post(msg.sender, title, content);
        return abi.encode(newPost);
    }
}
