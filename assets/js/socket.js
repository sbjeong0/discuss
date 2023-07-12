import { Socket } from "phoenix";
let socket = new Socket("/socket", { params: {token: window.userToken} });

socket.connect();

const createSocket = (topicId) => {
    let channel = socket.channel(`comments:${topicId}`, {});

    channel.join()
        .receive("ok", resp => { 
            rendereComments(resp.comments);
         })
        .receive("error", resp => { console.log("Unable to join", resp) });
    
    channel.on(`comments:${topicId}:new`, renderComment)
    
    document.querySelector("#id_add_comment").addEventListener('click', () => {
        const content = document.querySelector("textarea").value;
        channel.push("comment:add", { content: content });
    })
}


function rendereComments(comments){
    const renderedComments = comments.map(comment => {
        return `
            <li class="collection-item">
                ${comment.content}
            </li>
        `
    });
    document.querySelector(".collection").innerHTML = renderedComments.join('');
}

const renderComment = (event) => {
    const renderedComment = commentTemplate(event.comment)
    document.querySelector('.collection').innerHTML += renderedComment;
  }

  const commentTemplate = (comment) => {
    return `
    <li class="collection-item">
        ${comment.content}
    </li>`
  }

window.createSocket = createSocket;