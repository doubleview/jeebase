package com.doubleview.jeebase.support.plugin.chat;

import com.alibaba.fastjson.JSONObject;
import org.java_websocket.WebSocket;
import org.java_websocket.WebSocketImpl;
import org.java_websocket.framing.Framedata;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;

/**
 * 在线管理
 */
public class OnlineChatServer extends WebSocketServer {

    public OnlineChatServer(int port) throws UnknownHostException {
        super(new InetSocketAddress(port));
    }

    public OnlineChatServer(InetSocketAddress address) {
        super(address);
    }


    /**
     * 触发连接事件
     */
    @Override
    public void onOpen(WebSocket conn, ClientHandshake handshake) {
        //this.sendToAll( "new connection: " + handshake.getResourceDescriptor() );
        //System.out.println("===" + conn.getRemoteSocketAddress().getAddress().getHostAddress());
    }

    /**
     * 触发关闭事件
     */
    @Override
    public void onClose(WebSocket conn, int code, String reason, boolean remote) {
        userLeave(conn);
    }

    /**
     * 客户端发送消息到服务器时触发事件
     */
    @Override
    public void onMessage(WebSocket conn, String message) {
        message = message.toString();
        if (null != message && message.startsWith("[join]")) {
            this.userjoin(message.replaceFirst("\\[join\\]", ""), conn);
        }
        if (null != message && message.startsWith("[goOut]")) {
            this.goOut(message.replaceFirst("\\[goOut\\]", ""));
        } else if (null != message && message.startsWith("[leave]")) {
            this.userLeave(conn);
        } else if (null != message && message.startsWith("[count]")) {
            this.getUserCount(conn);
        } else if (null != message && message.startsWith("[getUserlist]")) {
            this.getUserList(conn);
        } else {
            OnlineChatServerPool.sendMessageToUser(conn, message);//同时向本人发送消息
        }
    }

    public void onFragment(WebSocket conn, Framedata fragment) {
    }

    /**
     * 触发异常事件
     */
    @Override
    public void onError(WebSocket conn, Exception ex) {
        //ex.printStackTrace();
        if (conn != null) {
            //some errors like port binding failed may not be assignable to a specific websocket
        }
    }


    /**
     * 用户加入处理
     *
     * @param user
     */
    public void userjoin(String user, WebSocket conn) {
        if (null == OnlineChatServerPool.getWebSocketByUser(user)) {                //判断用户是否在其它终端登录
            OnlineChatServerPool.addUser(user, conn);                            //向连接池添加当前的连接对象
        } else {
            goOut(conn, "goOut");
        }
    }

    /**
     * 强制某用户下线
     *
     * @param user
     */
    public void goOut(String user) {
        this.goOut(OnlineChatServerPool.getWebSocketByUser(user), "thegoout");
    }


    /**
     * 强制用户下线
     *
     * @param conn
     */
    public void goOut(WebSocket conn, String type) {
        JSONObject result = new JSONObject();
        result.put("type", type);
        result.put("msg", "goOut");
        OnlineChatServerPool.sendMessageToUser(conn, result.toJSONString());
    }

    /**
     * 用户下线处理
     *
     * @param conn
     */
    public void userLeave(WebSocket conn) {
        OnlineChatServerPool.removeUser(conn);                //在连接池中移除连接
    }

    /**
     * 获取在线总数
     *
     * @param conn
     */
    public void getUserCount(WebSocket conn) {
        JSONObject result = new JSONObject();
        result.put("type", "count");
        result.put("msg", OnlineChatServerPool.getUserCount());
        OnlineChatServerPool.sendMessageToUser(conn, result.toString());
    }

    /**
     * 获取在线用户列表
     *
     * @param conn
     */
    public void getUserList(WebSocket conn) {
        JSONObject result = new JSONObject();
        result.put("type", "userlist");
        result.put("list", OnlineChatServerPool.getOnlineUser());
        OnlineChatServerPool.sendMessageToUser(conn, result.toString());
    }

    public static void main(String[] args) throws InterruptedException, IOException {
        WebSocketImpl.DEBUG = false;
        int port = 8887; //端口
        OnlineChatServer s = new OnlineChatServer(port);
        s.start();
    }
}

