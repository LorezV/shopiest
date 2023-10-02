import { Input, Checkbox } from "@/components"

export default function SignInPage() {
  return (
    <form className="flex flex-col gap-y-5">
      <Input placeholder="Enter username" />

      <Input placeholder="Enter password" type="password" />

      <Checkbox label="Remember me?" description="In the future, you will not need to enter login details, they will be saved on the device." />

      <div className="flex flex-col sm:flex-row gap-x-5 gap-y-3">
        <div className="flex-1 flex flex-col">
          <button className="bg-orange-400 px-4 py-2 text-white">Sign In</button>
        </div>

        <div className="flex-1 flex flex-col text-center">
          <p>Don't have account yet? <a className="text-orange-400 hover:underline" href="/sign-up">Sign up for free!</a></p>
          <p className="text-gray-600 text-xs font-light">If you don't remember the password, you can <a className="text-orange-400 hover:underline" href="/sign-up">restore it.</a></p>
        </div>
      </div>
    </form>
  )
}