from flask import Response, jsonify, make_response


class APIResponse(Response):
    @classmethod
    def respond(cls, data):
        return make_response(jsonify(data=data))

    @classmethod
    def respond_error(cls, message="FyleError", status=400):
        return make_response(jsonify(error=message), status)
    
    @classmethod
    def respond_error_message(cls, error_name="FyleError", message="An error occurred", status=400):
        error_data = {
        "error": error_name,
        "message": message,
        "status": status
        }
        return make_response(jsonify(error_data), status)