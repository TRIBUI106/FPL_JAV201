package com.poly.lab8.websocket.json;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.websocket.Decoder;
import jakarta.websocket.EndpointConfig;

public class MessageDecoder implements Decoder.Text<Message> {

    private ObjectMapper mapper = new ObjectMapper();

    public void init(EndpointConfig config) {}
    public void destroy() {}

    @Override
    public Message decode(String json) {
        try {
            return mapper.readValue(json, Message.class);
        } catch (Exception e) {
            throw new RuntimeException("Decode error");
        }
    }

    @Override
    public boolean willDecode(String json) {
        return json.contains("text");
    }
}