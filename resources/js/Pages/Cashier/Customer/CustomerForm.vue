<template>
    <div>
        <div class="col-md-12">
            <div class="card mb-4">
                <h5 class="card-header">Customer Create</h5>
                <div class="card-body">

                    <form @submit.prevent="submit" autocomplete="off">
                        <h6 class="mb-b fw-normal">1. Account Details</h6>
                        <hr>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="name" v-model="form.name" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Primary
                                Number</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="primary_number"
                                    v-model="form.primary_number" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Additional
                                Number</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="additional_number"
                                    v-model="form.additional_number" />
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Email</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="email" v-model="form.email" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Address</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="address" v-model="form.address" />
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Date of Birth
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="date_of_birth"
                                    v-model="form.date_of_birth" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Join Date
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="join_date" v-model="form.join_date" />
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Remark
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="remark" v-model="form.remark" />
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Gender</label>
                            <div class="col-md-9">
                                <select name="gender" class="form-control" v-model="form.gender">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-search-input" class="col-md-3 col-form-label"></label>
                            <div class="col-md-9">
                                <button type="submit" class="btn btn-primary waves-effect waves-light">Save</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</template>
<script>


export default {
    name: "Create",

    props: [
        'user_name',
        'login_time',
        'customer',
    ],

    data() {
        return {
            form: {
                name: this.customer.name,
                primary_number: this.customer.primary_number,
                additional_number: this.customer.additional_number,
                email: this.customer.email,
                address: this.customer.address,
                date_of_birth: this.customer.date_of_birth,
                join_date: this.customer.join_date,
                remark: this.customer.remark,
                gender: this.customer.gender,
            }
        }
    },

    methods: {
        submit() {
            this.$emit('submit', this.form)
        }
    }
}
</script>
<style>

</style>