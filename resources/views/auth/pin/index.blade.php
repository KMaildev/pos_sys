@extends('layouts.pin')
@section('content')
    <style>
        .pin-login {
            display: inline-block;
            border-radius: 10px;
            padding: 10px;
            font-size: 28px;
            background: #d9deff;
            border: 1px solid #363b5e;
            user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -webkit-user-select: none;
            font-family: sans-serif;
        }

        .pin-login__text {
            margin: 10px auto 10px auto;
            padding: 10px;
            display: block;
            width: 50%;
            font-size: 0.5em;
            text-align: center;
            letter-spacing: 0.2em;
            background: rgba(0, 0, 0, 0.15);
            border: none;
            border-radius: 10px;
            outline: none;
            cursor: default;
        }

        .pin-login__text--error {
            color: #901818;
            background: #ffb3b3;
            animation-name: loginError;
            animation-duration: 0.1s;
            animation-iteration-count: 2;
        }

        @keyframes loginError {
            25% {
                transform: translateX(-3px);
            }

            75% {
                transform: translateX(3px);
            }
        }

        @-moz-keyframes loginError {
            25% {
                transform: translateX(-3px);
            }

            75% {
                transform: translateX(3px);
            }
        }

        .pin-login__key {
            width: 60px;
            height: 60px;
            margin: 10px;
            background: rgba(0, 0, 0, 0.15);
            color: #363b5e;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            cursor: pointer;
        }

        .pin-login__key:active {
            background: rgba(0, 0, 0, 0.25);
        }
    </style>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <center>
                    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                    <form action="{{ route('pin_login') }}" method="post" id="form-id">
                        @csrf
                        <input type='hidden' id='pinCode' name="pin_code" />
                        <div class="pin-login" id="mainPinLogin">
                            <input type="password" class="pin-login__text" autocomplete="off">
                            <div class="pin-login__numpad"></div>
                        </div>
                    </form>
                </center>
            </div>
        </div>
    </div>

    <script>
        class PinLogin {
            constructor({
                el,
                loginEndpoint,
                redirectTo,
                maxNumbers = Infinity
            }) {
                this.el = {
                    main: el,
                    numPad: el.querySelector(".pin-login__numpad"),
                    textDisplay: el.querySelector(".pin-login__text")
                };

                this.loginEndpoint = loginEndpoint;
                this.redirectTo = redirectTo;
                this.maxNumbers = maxNumbers;
                this.value = "";

                this._generatePad();
            }

            _generatePad() {
                const padLayout = [
                    "1", "2", "3",
                    "4", "5", "6",
                    "7", "8", "9",
                    "backspace", "0", "done"
                ];

                padLayout.forEach(key => {
                    const insertBreak = key.search(/[369]/) !== -1;
                    const keyEl = document.createElement("div");

                    keyEl.classList.add("pin-login__key");
                    keyEl.classList.toggle("material-icons", isNaN(key));
                    keyEl.textContent = key;
                    keyEl.addEventListener("click", () => {
                        this._handleKeyPress(key)
                    });
                    this.el.numPad.appendChild(keyEl);

                    if (insertBreak) {
                        this.el.numPad.appendChild(document.createElement("br"));
                    }
                });
            }

            _handleKeyPress(key) {
                switch (key) {
                    case "backspace":
                        this.value = this.value.substring(0, this.value.length - 1);
                        break;
                    case "done":
                        this._attemptLogin();
                        break;
                    default:
                        if (this.value.length < this.maxNumbers && !isNaN(key)) {
                            this.value += key;
                        }
                        break;
                }

                this._updateValueText();
            }

            _updateValueText() {
                this.el.textDisplay.value = "_".repeat(this.value.length);
                this.el.textDisplay.classList.remove("pin-login__text--error");
            }

            _attemptLogin() {
                document.getElementById("pinCode").value = this.value;
                var form = document.getElementById("form-id");
                form.submit();
                // if (this.value.length > 0) {
                //     fetch(this.loginEndpoint, {
                //         method: "post",
                //         headers: {
                //             "Content-Type": "application/x-www-form-urlencoded"
                //         },
                //         body: `pincode=${this.value}`
                //     }).then(response => {
                //         if (response.status === 200) {
                //             window.location.href = this.redirectTo;
                //         } else {
                //             this.el.textDisplay.classList.add("pin-login__text--error");
                //         }
                //     })
                // }
            }
        }

        new PinLogin({
            el: document.getElementById("mainPinLogin"),
            loginEndpoint: "#",
            redirectTo: "#"
        });
    </script>
@endsection
