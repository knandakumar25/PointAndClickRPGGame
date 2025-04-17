#res://scenes/DialogueScene.gd
extends Control

@onready var dialogue_text    := $DialogueText
@onready var choice_container := $ChoiceContainer

var story := {
	"final_reflection_start": {
		"text": """
[You open your eyes underwater. The currents around you are still. You’re neither sinking nor swimming. The silence presses on your chest, yet you breathe calmly. Ahead of you, Varuna waits—serene, ancient, watching. His eyes glimmer not with judgment, but with recognition.]

Varuna:
	"[Redacted]. You’ve come far—across oceans, across choices. This is not a trial. It is a mirror."

You:
	"Then why does it feel like judgment?"

Varuna:
	"Because deep down, you are unsure whether you were right."
""",
		"choices": [
			{ "text": "What makes you think I doubt myself?",           "next": "dialogue_doubt" },
			{ "text": "I came to see my family again. That’s all I ever wanted.", "next": "dialogue_family" },
			{ "text": "You say mirror—but all I see is the sea.",       "next": "dialogue_mirror" }
		]
	},
	"dialogue_doubt": {
		"text": """
Varuna:
	"Because you built a life out of compromise. And now, standing in the quiet, you ask yourself whether you gave too much."
""",
		"choices": [
			{ "text": "You mean the Company?",             "next": "dialogue_company" },
			{ "text": "You mean what I said to the crew?", "next": "dialogue_crew"   },
			{ "text": "You mean leaving home?",            "next": "dialogue_home"   }
		]
	},
	"dialogue_family": {
		"text": """
Varuna:
	"Your family. Yes. The anchor that never loosened. Yet you left them."

You:
	"To provide for them. To keep them safe."

Varuna:
	"You chose absence over presence. Wealth over memory."
""",
		"choices": [
			{ "text": "They understood. At least, I hope they did.", "next": "dialogue_family_understood" },
			{ "text": "I still write them. I still remember them.",  "next": "dialogue_family_memory"     }
		]
	},
	"dialogue_mirror": {
		"text": """
Varuna:
	"Because you see yourself reflected here. Every choice, every silence, every ambition."

You:
	"So you are me?"

Varuna:
	"No more than any thought you’ve buried. I am voice, not verdict."
""",
		"choices": [
			{ "text": "Then why do you feel so ancient?", "next": "dialogue_origin"  },
			{ "text": "Then what do you want from me?",    "next": "dialogue_request" }
		]
	},
	"dialogue_company": {
		"text": """
Varuna:
	"The East India Company gave you purpose. It also demanded your loyalty."

You:
	"And I gave it. I carried out my duty."

Varuna:
	"Even when it meant silence in the face of harm? Even when it meant playing diplomat for those who divided your people?"
""",
		"choices": [
			{ "text": "I thought I could help. Change things from within.", "next": "dialogue_change_from_within" },
			{ "text": "No, I was afraid. It was easier to serve than resist.", "next": "dialogue_complicity"    }
		]
	},
	"dialogue_crew": {
		"text": """
Varuna:
	"You rallied your crew with stories of visions. You invoked me."

You:
	"Because I truly believed in what I saw."

Varuna:
	"Did you? Or did fear guide your tongue?"
""",
		"choices": [
			{ "text": "It was both. I feared the storm. But I believed the vision.", "next": "dialogue_dual_motive" },
			{ "text": "It was a lie. I needed their trust. And I took it.",          "next": "dialogue_confession"   }
		]
	},
	"dialogue_home": {
		"text": """
Varuna:
	"You left your village. You left your name."

You:
	"To survive. My village had no future."

Varuna:
	"You traded your origin for a flag not your own. You called it duty."
""",
		"choices": [
			{ "text": "It was duty. I protected the ones I loved.", "next": "dialogue_duty_defense" },
			{ "text": "Perhaps I fled because I couldn’t bear to stay.", "next": "dialogue_escape"     }
		]
	},
	"dialogue_family_understood": {
		"text": """
Varuna:
	"Perhaps they did. But understanding is not absence. The empty chair remains."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_family_memory": {
		"text": """
Varuna:
	"Memory is sacred. But memory is not presence. What comfort is a letter when a child cries at night?"
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_origin": {
		"text": """
Varuna:
	"Because your ancestors once believed in me. And so, even as you shed names and gods, I remained. Not as divine. As memory."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_request": {
		"text": """
Varuna:
	"Nothing. I offer only space. For thought. For truth. For endings."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_change_from_within": {
		"text": """
Varuna:
	"And what did you change? What remains that bears your mark?"
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_complicity": {
		"text": """
Varuna:
	"Then speak that truth. Let it be known before silence swallows it again."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_dual_motive": {
		"text": """
Varuna:
	"So you acted from fear and faith. A dual heart. Not uncommon. But heavy."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_confession": {
		"text": """
Varuna:
	"Then you understand power. And the cost of wielding it."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_duty_defense": {
		"text": """
Varuna:
	"A noble cause. But nobility is not innocence."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"dialogue_escape": {
		"text": """
Varuna:
	"Flight is neither wrong nor right. But it is always telling."
""",
		"choices": [
			{ "text": "Continue...", "next": "reflection_loop" }
		]
	},
	"reflection_loop": {
		"text": """
[Varuna slowly circles you. Not like a predator, but like a tide curling in on itself.]

Varuna:
	"You’ve spoken. You’ve reflected. The ocean does not forget—but it does forgive."

You:
	"So what now?"

Varuna:
	"Now you choose. There is no escape from memory. But you may carry it differently."
""",
		"choices": [
			{ "text": "I want to return. Let me live—with everything I’ve seen.", "next": "ending_carry_on"        },
			{ "text": "I want peace. I want to leave all this behind.",            "next": "ending_walk_with_varuna" },
			{ "text": "What if I reject both? What if I choose silence?",          "next": "ending_silence"          }
		]
	},
	"ending_carry_on": {
		"text": """
[You awaken in your cabin. The candle is out. The storm is gone. But you are not the same.]

[Your thoughts are quiet. Not empty, but still. You rise. And live.]
""",
		"choices": []
	},
	"ending_walk_with_varuna": {
		"text": """
[You walk into the water beside him. Each step is lighter. Each breath easier.]

[The current accepts you. The tide bears you forward. You vanish, not as punishment—but as transformation.]
""",
		"choices": []
	},
	"ending_silence": {
		"text": """
[You say nothing. The world fades. Varuna does not move. In the silence, no judgment comes. Only stillness.]

[And the stillness lasts forever.]
""",
		"choices": []
	}
}

func _ready():
	_show_node("final_reflection_start")

func _show_node(key: String) -> void:
	var node = story.get(key)
	if node == null:
		push_error("Unknown dialogue key: %s" % key)
		return

	# clear old text
	dialogue_text.clear()

	# append new text
	dialogue_text.append_text(node.text)

	# remove old buttons
	for child in choice_container.get_children():
		child.queue_free()

	# if no choices...
	if node.choices.size() == 0:
		var end_btn = Button.new()
		end_btn.text = "The End"
		end_btn.disabled = true
		choice_container.add_child(end_btn)
		return

	# otherwise build buttons
	for choice in node.choices:
		var btn = Button.new()
		btn.text = choice.text
		choice_container.add_child(btn)
		btn.pressed.connect(
			Callable(self, "_on_choice_pressed").bind(choice.next)
		)



func _on_choice_pressed(next_key: String) -> void:
	_show_node(next_key)
