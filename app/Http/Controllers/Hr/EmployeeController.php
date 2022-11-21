<?php

namespace App\Http\Controllers\Hr;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

use App\Http\Requests\StoreEmployee;
use App\Http\Requests\UpdateEmployee;
use App\Http\Requests\updatePin;
use App\Models\Department;
use App\Models\MembersLists;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employees = User::all();
        return view('hr.employee.index', compact('employees'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $departments = Department::orderBy('title')->get();
        $roles = Role::all();
        return view('hr.employee.create', compact('departments', 'roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreEmployee $request)
    {
        if ($request->hasFile('passport_photo')) {
            $passport_photo = $request->file('passport_photo');
            $path = $passport_photo->store('public/passport');
        }

        if ($request->hasFile('nrc_front')) {
            $nrc_front = $request->file('nrc_front');
            $nrc_front_path = $nrc_front->store('public/photo');
        }

        if ($request->hasFile('nrc_back')) {
            $nrc_back = $request->file('nrc_back');
            $nrc_back_path = $nrc_back->store('public/photo');
        }

        $employee = new User();
        $employee->employee_id = $request->employee_id;
        $employee->name = $request->name;
        $employee->phone = $request->phone;
        $employee->email = $request->email;
        $employee->nrc_number = $request->nrc_number;
        $employee->gender = $request->gender;
        $employee->address = $request->address;
        $employee->department_id = $request->department_id;
        $employee->password = Hash::make($request->password);

        $employee->employment_type = $request->employment_type;
        $employee->join_date = $request->join_date;
        $employee->contact_person = $request->contact_person;
        $employee->emergency_contact = $request->emergency_contact;
        $employee->passport_photo = $path ?? '';
        $employee->nrc_front = $nrc_front_path ?? '';
        $employee->nrc_back = $nrc_back_path ?? '';
        $employee->members_list_file = '';

        $employee->save();
        $employee->syncRoles($request->roles);
        $user_id = $employee->id;
        if ($request->hasFile('members_list_file')) {
            foreach ($request->file('members_list_file') as $key => $file) {
                $path = $file->store('public/members_list_file');
                $original_name = $file->getClientOriginalName();

                $insert[$key]['members_list_file'] = $path;
                $insert[$key]['original_name'] = $original_name;

                $insert[$key]['user_id'] = $user_id;
                $insert[$key]['insert_user_id'] = auth()->user()->id;
                $insert[$key]['created_at'] =  date('Y-m-d H:i:s');
                $insert[$key]['updated_at'] =  date('Y-m-d H:i:s');
            }
            MembersLists::insert($insert);
        }
        return redirect()->back()->with('success', 'Employee is successfully created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $employee = User::findOrFail($id);
        $old_roles = $employee->roles->pluck('id')->toArray();
        $departments = Department::orderBy('title')->get();
        $roles = Role::all();

        $members_lists = MembersLists::where('user_id', $id)->get();
        return view('hr.employee.show', compact('employee', 'old_roles', 'departments', 'roles', 'members_lists'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $employee = User::findOrFail($id);
        $old_roles = $employee->roles->pluck('id')->toArray();
        $departments = Department::orderBy('title')->get();
        $roles = Role::all();

        $members_lists = MembersLists::where('user_id', $id)->get();
        return view('hr.employee.edit', compact('employee', 'old_roles', 'departments', 'roles', 'members_lists'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateEmployee $request, $id)
    {
        if ($request->hasFile('passport_photo')) {
            $passport_photo = $request->file('passport_photo');
            $path = $passport_photo->store('public/passport');
        }

        if ($request->hasFile('nrc_front')) {
            $nrc_front = $request->file('nrc_front');
            $nrc_front_path = $nrc_front->store('public/photo');
        }

        if ($request->hasFile('nrc_back')) {
            $nrc_back = $request->file('nrc_back');
            $nrc_back_path = $nrc_back->store('public/photo');
        }

        $employee = User::findOrFail($id);
        $employee->employee_id = $request->employee_id;
        $employee->name = $request->name;
        $employee->phone = $request->phone;
        $employee->email = $request->email;
        $employee->nrc_number = $request->nrc_number;
        $employee->gender = $request->gender;
        $employee->address = $request->address;
        $employee->department_id = $request->department_id;
        $employee->password = $request->password ? Hash::make($request->password) : $employee->password;

        $employee->employment_type = $request->employment_type;
        $employee->join_date = $request->join_date;
        $employee->contact_person = $request->contact_person;
        $employee->emergency_contact = $request->emergency_contact;
        $employee->passport_photo = $path ?? $employee->passport_photo;

        $employee->nrc_front = $nrc_front_path ?? $employee->nrc_front;
        $employee->nrc_back = $nrc_back_path ?? $employee->nrc_back;
        $employee->members_list_file = '';

        $employee->update();
        $employee->syncRoles($request->roles);
        return redirect()->back()->with('success', 'Employee is successfully updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function showPin($id)
    {
        $employee = User::findOrFail($id);
        return view('hr.employee.show_pin', compact('employee'));
    }

    public function updatePin(updatePin $request)
    {
        $id = $request->user_id;
        $employee = User::findOrFail($id);
        $employee->pin_code = $employee->pin_code ?? $request->pin_code;
        $employee->update();
        return redirect()->back()->with('success', 'Success.');
    }
}
