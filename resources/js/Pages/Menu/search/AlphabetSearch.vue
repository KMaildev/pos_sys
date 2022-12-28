<template>
    <div class="alphabet-search">
        <span class="f-char" @click="searchAlphabetSearch('A')">A</span>
        <span class="f-char" @click="searchAlphabetSearch('B')">B</span>
        <span class="f-char" @click="searchAlphabetSearch('C')">C</span>
        <span class="f-char" @click="searchAlphabetSearch('D')">D</span>
        <span class="f-char" @click="searchAlphabetSearch('E')">E</span>
        <span class="f-char" @click="searchAlphabetSearch('F')">F</span>
        <span class="f-char" @click="searchAlphabetSearch('G')">G</span>
        <span class="f-char" @click="searchAlphabetSearch('H')">H</span>
        <span class="f-char" @click="searchAlphabetSearch('I')">I</span>
        <span class="f-char" @click="searchAlphabetSearch('J')">J</span>
        <span class="f-char" @click="searchAlphabetSearch('K')">K</span>
        <span class="f-char" @click="searchAlphabetSearch('L')">L</span>
        <span class="f-char" @click="searchAlphabetSearch('M')">M</span>
        <span class="f-char" @click="searchAlphabetSearch('N')">N</span>
        <span class="f-char" @click="searchAlphabetSearch('O')">O</span>
        <span class="f-char" @click="searchAlphabetSearch('P')">P</span>
        <span class="f-char" @click="searchAlphabetSearch('Q')">Q</span>
        <span class="f-char" @click="searchAlphabetSearch('R')">R</span>
        <span class="f-char" @click="searchAlphabetSearch('S')">S</span>
        <span class="f-char" @click="searchAlphabetSearch('T')">T</span>
        <span class="f-char" @click="searchAlphabetSearch('U')">U</span>
        <span class="f-char" @click="searchAlphabetSearch('V')">V</span>
        <span class="f-char" @click="searchAlphabetSearch('W')">W</span>
        <span class="f-char" @click="searchAlphabetSearch('X')">X</span>
        <span class="f-char" @click="searchAlphabetSearch('Y')">Y</span>
        <span class="f-char" @click="searchAlphabetSearch('Z')">Z</span>
    </div>
</template>
<script>

export default {
    name: "AlphabetSearch",

    methods: {
        searchAlphabetSearch(keyword) {
            let type = null;
            let category_id = null;
            this.$inertia.get(`/pos_menu?type=${type}&&category_id=${category_id}&&keyword=${keyword}`);
        },
    },
}
</script>
<style>
.f-char {
    border: 1px solid #eee;
    background: #808080;
    display: inline-block;
    width: 48px;
    height: 48px;
    text-align: center;
    vertical-align: middle;
    line-height: 48px;
    cursor: pointer;
}
</style>