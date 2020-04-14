import sys
print("SYS PATH ###########")
print(sys.path)
print("SYS PATH ###########")

from app import create_app

app = create_app()

if __name__ == "__main__":
    app.logger.info("Starting Server")
    app.run(host='0.0.0.0', port=5000, debug=True)