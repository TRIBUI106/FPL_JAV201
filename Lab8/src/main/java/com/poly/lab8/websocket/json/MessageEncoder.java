package com.poly.lab8.websocket.json;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.websocket.Encoder;
import jakarta.websocket.EndpointConfig;

public class MessageEncoder implements Encoder.Text<Message> {

    private ObjectMapper mapper = new ObjectMapper();

    public void init(EndpointConfig config) {}
    public void destroy() {}

    @Override
    public String encode(Message message) {
        try {
            return mapper.writeValueAsString(message);
        } catch (Exception e) {
            throw new RuntimeException("Encode error");
        }
    }
}