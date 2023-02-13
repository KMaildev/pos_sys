<template>
    <div>
        <form @submit.prevent="search">
            <div class="input-group">
                <input type="text" class="form-control form-control-lg" v-model="search_keyword">
                <span class="input-group-text" @click="showMMSearch()">
                    MM
                </span>
                <span class="input-group-text" @click="showEngSearch()">
                    ENG
                </span>
                <button type="submit" class="btn btn-secondary btn-lg">
                    Search
                </button>
                <button @click="linkMenu()" type="button" class="btn btn-outline-secondary btn-lg"
                    style="background-color: #F09033; color: black">
                    Back
                </button>
            </div>
        </form>

        <!-- ENG Search Model  -->
        <div class="modal fade" id="showEngSearchModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: black;">
                        <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                            Search
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            style="color: white;">
                            <i class="fas fa-x fa-2xl"></i>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-md-12">
                                    <form @submit.prevent="search">
                                        <div class="input-group">
                                            <input type="text" class="form-control form-control-lg"
                                                v-model="search_keyword" readonly="true">
                                            <button type="submit" class="btn btn-secondary btn-lg">
                                                Search
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char a" style="background-color: #6CD5F0;"
                                        @click="searchAlphabetSearch('A')">
                                        A
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char b" style="background-color: #CA4445;"
                                        @click="searchAlphabetSearch('B')">
                                        B
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char c" style="background-color: #E59B2F;"
                                        @click="searchAlphabetSearch('C')">
                                        C
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char d" style="background-color: #EBD942;"
                                        @click="searchAlphabetSearch('D')">
                                        D
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char e" style="background-color: #AF4196;"
                                        @click="searchAlphabetSearch('E')">
                                        E
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char f" style="background-color: ##63C151;"
                                        @click="searchAlphabetSearch('F')">
                                        F
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char g" style="background-color: #804FA1;"
                                        @click="searchAlphabetSearch('G')">
                                        G
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char h" style="background-color: #D8489F;"
                                        @click="searchAlphabetSearch('H')">
                                        H
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char i" style="background-color: #3B86BD;"
                                        @click="searchAlphabetSearch('I')">
                                        I
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char g" style="background-color: #68CB61;"
                                        @click="searchAlphabetSearch('J')">
                                        J
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char k" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('K')">
                                        K
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char l" style="background-color: #D65456;"
                                        @click="searchAlphabetSearch('L')">
                                        L
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char m" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('M')">
                                        M
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char n" style="background-color: #D14F4F;"
                                        @click="searchAlphabetSearch('N')">
                                        N
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char o" style="background-color: #E39B2F;"
                                        @click="searchAlphabetSearch('O')">
                                        O
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char p" style="background-color: #E2C92C;"
                                        @click="searchAlphabetSearch('P')">
                                        P
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char q" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('Q')">
                                        Q
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char r" style="background-color: #63C254;"
                                        @click="searchAlphabetSearch('R')">
                                        R
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char s" style="background-color: #8E58AE;"
                                        @click="searchAlphabetSearch('S')">
                                        S
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char t" style="background-color: #D8489F;"
                                        @click="searchAlphabetSearch('T')">
                                        T
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char u" style="background-color: #3A83BB;"
                                        @click="searchAlphabetSearch('U')">
                                        U
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char v" style="background-color: #63C151;"
                                        @click="searchAlphabetSearch('V')">
                                        V
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char w" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('W')">
                                        W
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char x" style="background-color: #CB4747;"
                                        @click="searchAlphabetSearch('X')">
                                        X
                                    </span>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center">
                                <div class="col-md-2">
                                    <span class="a-char y" style="background-color: #C94244;"
                                        @click="searchAlphabetSearch('Y')">
                                        Y
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('Z')">
                                        Z
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="removeAlphabetSearch()">
                                        <i class="fa-sharp fa-solid fa-delete-left"></i>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Myanmar Search -->
        <div class="modal fade" id="showMMSearchModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: black;">
                        <h5 class="modal-title" id="exampleModalLabelMM" style="color: white;">
                            Search
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            style="color: white;">
                            <i class="fas fa-x fa-2xl"></i>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-md-12">
                                    <form @submit.prevent="search">
                                        <div class="input-group">
                                            <input type="text" class="form-control form-control-lg"
                                                v-model="search_keyword" readonly="true">
                                            <button type="submit" class="btn btn-secondary btn-lg">
                                                Search
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char a" style="background-color: #6CD5F0;"
                                        @click="searchAlphabetSearch('က')">
                                        က
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char b" style="background-color: #CA4445;"
                                        @click="searchAlphabetSearch('ခ')">
                                        ခ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char c" style="background-color: #E59B2F;"
                                        @click="searchAlphabetSearch('ဂ')">
                                        ဂ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char d" style="background-color: #EBD942;"
                                        @click="searchAlphabetSearch('ဃ')">
                                        ဃ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char e" style="background-color: #AF4196;"
                                        @click="searchAlphabetSearch('င')">
                                        င
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char f" style="background-color: ##63C151;"
                                        @click="searchAlphabetSearch('စ')">
                                        စ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char g" style="background-color: #804FA1;"
                                        @click="searchAlphabetSearch('ဆ')">
                                        ဆ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char h" style="background-color: #D8489F;"
                                        @click="searchAlphabetSearch('ဇ')">
                                        ဇ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char i" style="background-color: #3B86BD;"
                                        @click="searchAlphabetSearch('ဈ')">
                                        ဈ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char g" style="background-color: #68CB61;"
                                        @click="searchAlphabetSearch('ည')">
                                        ည
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char k" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('ဋ')">
                                        ဋ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char l" style="background-color: #D65456;"
                                        @click="searchAlphabetSearch('ဌ')">
                                        ဌ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char m" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('ဍ')">
                                        ဍ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char n" style="background-color: #D14F4F;"
                                        @click="searchAlphabetSearch('ဎ')">
                                        ဎ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char n" style="background-color: #D14F4F;"
                                        @click="searchAlphabetSearch('ဏ')">
                                        ဏ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char o" style="background-color: #E39B2F;"
                                        @click="searchAlphabetSearch('တ')">
                                        တ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char p" style="background-color: #E2C92C;"
                                        @click="searchAlphabetSearch('ထ')">
                                        ထ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char q" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('ဒ')">
                                        ဒ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char r" style="background-color: #63C254;"
                                        @click="searchAlphabetSearch('ဓ')">
                                        ဓ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char s" style="background-color: #8E58AE;"
                                        @click="searchAlphabetSearch('န')">
                                        န
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char t" style="background-color: #D8489F;"
                                        @click="searchAlphabetSearch('ပ')">
                                        ပ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char u" style="background-color: #3A83BB;"
                                        @click="searchAlphabetSearch('ဖ')">
                                        ဖ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char v" style="background-color: #63C151;"
                                        @click="searchAlphabetSearch('ဗ')">
                                        ဗ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char w" style="background-color: #54C3EF;"
                                        @click="searchAlphabetSearch('ဘ')">
                                        ဘ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char x" style="background-color: #CB4747;"
                                        @click="searchAlphabetSearch('မ')">
                                        မ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char y" style="background-color: #C94244;"
                                        @click="searchAlphabetSearch('ယ')">
                                        ယ
                                    </span>
                                </div>

                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('ရ')">
                                        ရ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('လ')">
                                        လ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('ဝ')">
                                        ဝ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('သ')">
                                        သ
                                    </span>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center">

                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('ဟ')">
                                        ဟ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('ဠ')">
                                        ဠ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="searchAlphabetSearch('အ')">
                                        အ
                                    </span>
                                </div>


                                <div class="col-md-2">
                                    <span class="a-char z" style="background-color: #AB4090;"
                                        @click="removeAlphabetSearch()">
                                        <i class="fa-sharp fa-solid fa-delete-left"></i>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "SearchFormBack",

    data() {
        return {
            search_keyword: null,
            abcd_arr: [],
            form: {
                q: this.q,
            }
        }
    },

    methods: {
        showEngSearch() {
            $('#showEngSearchModal').modal('show');
        },

        searchAlphabetSearch(keyword) {
            this.abcd_arr.push(keyword);
            this.search_keyword = this.abcd_arr.join("");
            this.search();
        },

        removeAlphabetSearch() {
            this.abcd_arr = [];
            this.search_keyword = this.abcd_arr.join("");
        },

        search() {
            $('#showEngSearchModal').modal('hide');
            $('#showMMSearchModal').modal('hide');
            this.$inertia.get(`/view_menu_lists_search?search=${this.search_keyword}`);
        },

        showMMSearch() {
            $('#showMMSearchModal').modal('show');
        },

        linkMenu() {
            let type = 'Beverage';
            this.$inertia.get(`/view_pos_menu?type=${type}`);
        },
    },
}
</script>
<style>
.a-char {
    border: 1px solid #eee;
    background: #808080;
    display: inline-block;
    width: 70px;
    height: 68px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    font-size: 40px;
    color: white;
    border: 2px solid black;
    border-radius: 10px;
    margin-top: 10px;
}
</style>