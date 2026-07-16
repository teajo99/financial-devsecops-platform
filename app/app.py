from flask import Flask, jsonify, request
import uuid

app = Flask(__name__)

transactions = []


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


@app.route("/transactions", methods=["GET"])
def get_transactions():
    return jsonify(transactions)


@app.route("/transactions", methods=["POST"])
def create_transaction():

    data = request.get_json()

    transaction = {
        "id": str(uuid.uuid4()),
        "amount": data.get("amount"),
        "currency": data.get("currency"),
        "status": "Processed"
    }

    transactions.append(transaction)

    return jsonify(transaction), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
