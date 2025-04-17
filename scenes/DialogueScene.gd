#res://scenes/DialogueScene.gd
extends Control

@onready var dialogue_text    := $DialogueText
@onready var choice_container := $ChoiceContainer

var story := {
	"final_reflection_start": {
		"text": """
[You open your eyes underwater. The currents around you are still. You’re neither sinking nor swimming. The silence presses on your chest, yet you breathe calmly. Salt drifts in eddies around you, and distant light ripples across your vision. Ahead of you, Varuna waits—serene, ancient, watching. His eyes glimmer not with judgment, but with recognition.]

Varuna:
	"[Redacted]. You’ve come far—across oceans, across choices. This is not a trial. It is a mirror."

You:
	"Then why does it feel like judgment?"

Varuna:
	"Because deep down, you are unsure whether you were right. And uncertainty bears weight."
""",
		"choices": [
			{ "text": "What makes you think I doubt myself?",                           "next": "dialogue_doubt"      },
			{ "text": "I came to see my family again…",                                 "next": "dialogue_family"     },
			{ "text": "You say mirror—but all I see is the sea.",                       "next": "dialogue_mirror"     },
			{ "text": "Speak to my conscience—what of my morality?",                    "next": "dialogue_morality"   }
		]
	},

	"dialogue_doubt": {
		"text": """
Varuna:
	"Because you built a life out of compromise. You traded conviction for comfort, and now you wonder if you lost yourself."

You:
	"I did what I had to—to survive, to protect."

Varuna:
	"Protection and survival are roots. But what grew from them? Did your shelter become a cage?"
""",
		"choices": [
			{ "text": "You mean the Company?",             "next": "dialogue_company" },
			{ "text": "You mean what I said to the crew?", "next": "dialogue_crew"    },
			{ "text": "You mean leaving home?",            "next": "dialogue_home"    }
		]
	},

	"dialogue_family": {
		"text": """
Varuna:
	"Your family—yes, the anchor that never loosened. Yet you left them for promise of gold and glory."

You:
	"Their safety required distance. I sent letters, sent money…"

Varuna:
	"Mere words can never warm an empty cradle. Have you forgiven yourself for that absence?"
""",
		"choices": [
			{ "text": "They understood—I believe they did.",    "next": "dialogue_family_understood" },
			{ "text": "I write to them every day. Is that enough?", "next": "dialogue_family_memory"   }
		]
	},
	"dialogue_family_understood": {
		"text": """
Varuna:
	"Perhaps. But understanding without presence leaves a wound that seeps in silence. You carry that scar within you."
""",
		"choices": [
			{ "text": "…Continue", "next": "family_followup" }
		]
	},
	"dialogue_family_memory": {
		"text": """
Varuna:
	"Memory is sacred, yet it is no substitute for breath beside breath. Comfort or torment—what does your memory bring you?"
""",
		"choices": [
			{ "text": "Both comfort and torment.", "next": "family_followup" }
		]
	},
	"family_followup": {
		"text": """
Varuna:
	"Time may dull pain, but it also blurs gratitude. Will you let memory bind you to sorrow, or set it free to guide you home?"

You:
	"I fear forgetting more than I fear living with regret."
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"dialogue_mirror": {
		"text": """
Varuna:
	"A mirror does not lie, yet it only shows the surface. Your choices ripple beneath."

You:
	"So you are me?"

Varuna:
	"No more than any reflection is the sun. I am thought, not origin."
""",
		"choices": [
			{ "text": "Then why so ancient?",           "next": "dialogue_origin"   },
			{ "text": "Then what is your desire?",      "next": "dialogue_request"  }
		]
	},
	"dialogue_origin": {
		"text": """
Varuna:
	"Because your ancestors called upon me. Through storms and seasons, I remained—memory of the sea, witness to your lineage."
""",
		"choices": [
			{ "text": "I never saw that before.", "next": "mirror_followup" }
		]
	},
	"dialogue_request": {
		"text": """
Varuna:
	"Desire? Only that you see clearly—not through fear nor hope, but through truth."
""",
		"choices": [
			{ "text": "Show me that truth.", "next": "mirror_followup" }
		]
	},
	"mirror_followup": {
		"text": """
Varuna:
	"Truth is a current—sometimes gentle, sometimes crushing. Will you face it, unguarded, and steer your life by its flow?"

You:
	"I will, even if I drown."
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"dialogue_morality": {
		"text": """
Varuna:
	"Morality is not a map, but the choice to draw one’s own path. Duty, loyalty, faith—they are pillars. But what of compassion?"

You:
	"Compassion is costly."

Varuna:
	"Cost is the currency of the soul. Does your ledger balance?"
""",
		"choices": [
			{ "text": "Mercy costs the innocent.",      "next": "dialogue_weakness_vs_strength" },
			{ "text": "Mercy costs the guilty.",        "next": "dialogue_mercy_strength"       }
		]
	},
	"dialogue_weakness_vs_strength": {
		"text": """
Varuna:
	"Weakness? No. It takes courage to spare lives when none owe you kindness. Strength lies in restraint."
""",
		"choices": [
			{ "text": "…Continue", "next": "morality_followup" }
		]
	},
	"dialogue_mercy_strength": {
		"text": """
Varuna:
	"Yes. Mercy is the quiet roar of your better self. It echoes long after blades fall silent."
""",
		"choices": [
			{ "text": "…Continue", "next": "morality_followup" }
		]
	},
	"morality_followup": {
		"text": """
Varuna:
	"Every act of mercy shapes the soul’s horizon. On your return, will you extend that mercy to yourself?"

You:
	"I will try."
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"dialogue_company": {
		"text": """
Varuna:
	"The Company promised order and profit—but at what price did you uphold its banner?"

You:
	"It gave me purpose—direction in a chaotic world."

Varuna:
	"Purpose is a gift and a chains. Did you wield it for justice, or as excuse?"
""",
		"choices": [
			{ "text": "I believed I served the greater good.", "next": "dialogue_change_from_within" },
			{ "text": "I feared resistance more than injustice.", "next": "dialogue_complicity" },
			{ "text": "Tell me of home—what is home, truly?",     "next": "dialogue_nationalism" }
		]
	},
	"dialogue_change_from_within": {
		"text": """
Varuna:
	"Change from within demands sacrifice. Did you speak out when you saw harm, or stay silent to keep your place?"
""",
		"choices": [
			{ "text": "I spoke out—but my voice was faint.",    "next": "company_followup" }
		]
	},
	"dialogue_complicity": {
		"text": """
Varuna:
	"Complicity is the echo of cowardice. Speak that truth now, before silence consumes you."
""",
		"choices": [
			{ "text": "So I speak.", "next": "company_followup" }
		]
	},
	"dialogue_nationalism": {
		"text": """
Varuna:
	"Home is not soil or flags—it is the pulse of belonging. You bore foreign colors, but did your heart remain tethered?"
""",
		"choices": [
			{ "text": "I loved both—sometimes unevenly.", "next": "company_followup" }
		]
	},
	"company_followup": {
		"text": """
Varuna:
	"To serve is to choose: justice or comfort. On your return, will you rebuild the world you once upheld, or forge a new one?"
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"dialogue_crew": {
		"text": """
Varuna:
	"You led your crew through storms and strife, invoking me as guide."

You:
	"They placed their lives in my hands."

Varuna:
	"Leadership is stewardship, not command. Did you protect them, or use them to shroud your fear?"
""",
		"choices": [
			{ "text": "I bore their trust as honor.",   "next": "dialogue_leadership"      },
			{ "text": "I bore their fate as burden.",   "next": "dialogue_loyalty_vs_truth" }
		]
	},
	"dialogue_leadership": {
		"text": """
Varuna:
	"Honor without humility can become hubris. A true leader listens to the silence between words."
""",
		"choices": [
			{ "text": "…Continue", "next": "crew_followup" }
		]
	},
	"dialogue_loyalty_vs_truth": {
		"text": """
Varuna:
	"Loyalty binds, but truth frees. When they conflict, which did you choose?"
""",
		"choices": [
			{ "text": "I chose loyalty.", "next": "crew_followup" },
			{ "text": "I chose truth.",   "next": "crew_followup" }
		]
	},
	"crew_followup": {
		"text": """
Varuna:
	"Your choices steered many lives. Will you now steer them by wisdom, not fear?"
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"dialogue_home": {
		"text": """
Varuna:
	"You left your village and your name. Survival demanded sacrifice."

You:
	"The crust of this earth had nothing left for me."

Varuna:
	"Yet soil roots the soul. In flight we pay the toll of nostalgia."
""",
		"choices": [
			{ "text": "I carry nostalgia like a wound.", "next": "dialogue_home_nostalgia" },
			{ "text": "I left to find myself.",          "next": "dialogue_home_loss"       }
		]
	},
	"dialogue_home_nostalgia": {
		"text": """
Varuna:
	"Nostalgia is a ghost that warms and wails. Does it guide you, or haunt you?"
""",
		"choices": [
			{ "text": "Haunt me, if it must.", "next": "home_followup" }
		]
	},
	"dialogue_home_loss": {
		"text": """
Varuna:
	"Loss carves space for new roots—yet you cannot deny the past you abandoned."
""",
		"choices": [
			{ "text": "I cannot deny it.", "next": "home_followup" }
		]
	},
	"home_followup": {
		"text": """
Varuna:
	"Roots may shift, but the earth remains. On your return, will you plant anew or rediscover what you left behind?"
""",
		"choices": [
			{ "text": "…Continue", "next": "reflection_loop" }
		]
	},

	"reflection_loop": {
		"text": """
[Varuna slowly circles you, as though the ocean itself moved about your heart.]

Varuna:
	"You’ve spoken. You’ve reflected. The ocean does not forget—but it forgives the willing."

You:
	"So what now?"

Varuna:
	"Now you choose. There is no escape from memory. But you may carry it differently."
""",
		"choices": [
			{ "text": "I want to return. Let me live—with everything I’ve seen.", "next": "ending_carry_on"        },
			{ "text": "I want peace. Let me leave all this behind.",              "next": "ending_walk_with_varuna" },
			{ "text": "What if I reject both? What if I choose silence?",        "next": "ending_silence"          }
		]
	},

	"ending_carry_on": {
		"text": """
[You awaken in your cabin. The candle is out. The storm is gone. But you are not the same.]

[Your thoughts are quiet, not empty. You rise. And live differently.]
""",
		"choices": []
	},
	"ending_walk_with_varuna": {
		"text": """
[You walk into the water beside him. Each step is lighter. Each breath easier.]

[The tide carries you forward. You vanish—not as punishment, but transformation.]
""",
		"choices": []
	},
	"ending_silence": {
		"text": """
[You say nothing. The world fades. In the silence, no judgment comes. Only stillness.]

[And the stillness endures.]
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
		end_btn.pressed.connect(Callable(self, "_on_end_pressed"))
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

func _on_end_pressed() -> void:
	get_tree().quit()

func _on_choice_pressed(next_key: String) -> void:
	_show_node(next_key)
