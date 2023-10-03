import { Tabs, Input, Checkbox } from "@/components"

export default function SignInPage() {
    return (
        <Tabs className="max-w-xl" tabs={[
            {
                title: "Customer",
                description: "You can open disputes, track your purchase history and follow updates.",
                node: (
                    <form className="flex flex-col gap-y-5 mt-10">
                        <div className="flex gap-x-5">
                            <Input className="flex-1" placeholder="First name" />
                            <Input className="flex-1" placeholder="Last name" />
                        </div>

                        <Input placeholder="Email" />

                        <div className="flex gap-x-5">
                            <Input className="flex-1" placeholder="Password" type="password" />
                            <Input className="flex-1" placeholder="Password repeat" type="password" />
                        </div>


                        <Checkbox label="Accept eula" description={<span>Before registering, read the <a className="text-orange-400 hover:underline" href="#">terms of use</a> of the resource and the <a className="text-orange-400 hover:underline" href="#">privacy policy.</a></span>} />

                        <div className="flex gap-x-5">
                            <button className="bg-orange-400 px-4 py-2 text-white flex-1">Sign Up</button>

                            <div className="flex-1">
                                <p>If you already have an account, please <a className="text-orange-400 hover:underline" href="/sign-in">sign in.</a></p>
                            </div>
                        </div>
                    </form>
                )
            },
            {
                title: "Seller",
                description: "You can run your store, monitor products and get analytics.",
                node: (
                    <form className="flex flex-col gap-y-5 mt-10">
                        <Input placeholder="Organization name" />

                        <Input placeholder="Email" />

                        <Input placeholder="Address" />

                        <div className="flex gap-x-5">
                            <Input className="flex-1" placeholder="Password" type="password" />
                            <Input className="flex-1" placeholder="Password repeat" type="password" />
                        </div>

                        <Checkbox label="Accept eula" description={<span>Before registering, read the <a className="text-orange-400 hover:underline" href="#">terms of use</a> of the resource and the <a className="text-orange-400 hover:underline" href="#">privacy policy.</a></span>} />

                        <div className="flex gap-x-5">
                            <button className="bg-orange-400 px-4 py-2 text-white flex-1">Sign Up</button>

                            <div className="flex-1">
                                <p>If you already have an account, please <a className="text-orange-400 hover:underline" href="/sign-in">sign in.</a></p>
                            </div>
                        </div>
                    </form>
                )
            }
        ]} />
    )
}