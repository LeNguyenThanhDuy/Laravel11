<?php

namespace App\Http\Controllers;

use Hash;
use Session;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
 * CRUD User controller
 */
class CrudUserController extends Controller
{
    const MAX_RECORDS = 10;
    /**
     * Login page
     */
    public function login()
    {
        return view('crud_user.login');
    }

    /**
     * User submit form login
     */
    public function authUser(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            return redirect()->intended('list')
                ->withSuccess('Signed in');
        }

        return redirect("login")->withSuccess('Login details are not valid');
    }

    /**
     * Registration page
     */
    public function createUser()
    {
        return view('crud_user.create');
    }

    /**
     * User submit form register
     */
    public function postUser(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            //------//
            //'confirm_password' => 'required|min:6',
            // 'phone' => 'nullable|max:15',
            // 'address' => 'nullable|max:255',

           
            // 'like' => 'required|numeric|min:0',
            // 'github' => 'required|numeric|min:0',
        ]);

        $data = $request->all();
        $check = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            //
            //'confirm_password' => Hash::make($data['password']),
            // 'phone' => $data['phone'] ?? null,
            // 'address' => $data['address'] ?? null,
            // 'like' => $data['like'] ?? null,
            // 'github' => $data['github'] ?? null,
        ]);

        return redirect("login");
    }

    /**
     * View user detail page hello kiemtra
     */
    public function readUser(Request $request)
    {
        $user_id = $request->get('id');
        $user = User::find($user_id);

        return view('crud_user.read', ['messi' => $user]);
    }

    /**
     * Delete user by id
     */
    public function deleteUser(Request $request)
    {
        $user_id = $request->get('id');
        $user = User::destroy($user_id);

        return redirect("list")->withSuccess('You have signed-in');
    }

    /**
     * Form update user page
     */
    public function updateUser(Request $request)
    {
        $user_id = $request->get('id');
        $user = User::find($user_id);

        return view('crud_user.update', ['user' => $user]);
    }

    /**
     * Submit form update user
     */
    public function postUpdateUser(Request $request)
    {
        $input = $request->all();

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,id,' . $input['id'],
            'password' => 'required|min:6',
            //
            //'confirm_password' => 'required|min:6',
            // 'phone' => 'nullable|max:15',
            // 'address' => 'nullable|max:255',
            // 'diachi' => 'nullable|string|max:255',
            // 'like' => 'nullable|string|max:255',
            // 'github' => 'nullable|string|max:255',
        ]);

        $user = User::find($input['id']);
        $user->name = $input['name'];
        $user->email = $input['email'];
        $user->password = $input['password'];
        ///
        //$user->password = $input['confirm_password'];
       // $user->like = $input['phone'] ?? null;
        // $user->address = $input['address'] ?? null;
        // $user->diachi = $input['diachi'] ?? null;
        // $user->like = $input['like'] ?? null;
        // $user->github = $input['github'] ?? null;
        $user->save();

        return redirect("list")->withSuccess('You have signed-in');
    }

    /**
     * List of users
     */
    public function listUser()
    {
        if(Auth::check()){
            $users = User::paginate(self::MAX_RECORDS);

            return view('crud_user.list', ['users' => $users]);
        }

        return redirect("login")->withSuccess('You are not allowed to access');
    }

    /**
     * Sign out
     */
    public function signOut()
    {
        Session::flush();
        Auth::logout();

        return Redirect('login');
    }
}