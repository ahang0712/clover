; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_010/svp_simple_010_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_010/svp_simple_010_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%union.pack1 = type { i32 }
%struct.pack2 = type { i8, i32 }

@svp_simple_010_001_global_union = common global %union.pack1 zeroinitializer, align 4, !dbg !0
@svp_simple_010_001_global_struct = common global %struct.pack2 zeroinitializer, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_010_001_main() #0 !dbg !29 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %1, metadata !33, metadata !DIExpression()), !dbg !35
  store i32 1, i32* %1, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %2, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 2, i32* %2, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %3, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 3, i32* %3, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %4, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 4, i32* %4, align 4, !dbg !41
  %5 = load i32, i32* %1, align 4, !dbg !42
  %6 = trunc i32 %5 to i8, !dbg !42
  store volatile i8 %6, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !43
  %7 = load i32, i32* %2, align 4, !dbg !44
  store volatile i32 %7, i32* getelementptr inbounds (%union.pack1, %union.pack1* @svp_simple_010_001_global_union, i32 0, i32 0), align 4, !dbg !45
  %8 = load i32, i32* %3, align 4, !dbg !46
  %9 = trunc i32 %8 to i8, !dbg !46
  store volatile i8 %9, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !47
  %10 = load i32, i32* %4, align 4, !dbg !48
  store volatile i32 %10, i32* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 1), align 4, !dbg !49
  ret void, !dbg !50
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_010_001_isr_1() #0 !dbg !51 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %1, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %2, metadata !55, metadata !DIExpression()), !dbg !56
  %3 = load volatile i8, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !57
  %4 = zext i8 %3 to i32, !dbg !58
  store i32 %4, i32* %1, align 4, !dbg !59
  %5 = load volatile i8, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !60
  %6 = zext i8 %5 to i32, !dbg !61
  store i32 %6, i32* %2, align 4, !dbg !62
  ret void, !dbg !63
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!23, !24, !25, !26, !27}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_010_001_global_union", scope: !2, file: !8, line: 14, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_010/svp_simple_010_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_010_001_global_struct", scope: !2, file: !8, line: 15, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_010/svp_simple_010_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "svp_simple_010_001_struct", file: !8, line: 12, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pack2", file: !8, line: 9, size: 64, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !11, file: !8, line: 10, baseType: !14, size: 8)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !11, file: !8, line: 11, baseType: !16, size: 32, offset: 32)
!16 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "svp_simple_010_001_union", file: !8, line: 7, baseType: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pack1", file: !8, line: 4, size: 32, elements: !20)
!20 = !{!21, !22}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !19, file: !8, line: 5, baseType: !14, size: 8)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !19, file: !8, line: 6, baseType: !16, size: 32)
!23 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{!"clang version 10.0.0 "}
!29 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !8, file: !8, line: 17, type: !30, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocation(line: 18, column: 3, scope: !29)
!33 = !DILocalVariable(name: "svp_simple_010_001_local_var1", scope: !29, file: !8, line: 19, type: !34)
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DILocation(line: 19, column: 7, scope: !29)
!36 = !DILocalVariable(name: "svp_simple_010_001_local_var2", scope: !29, file: !8, line: 20, type: !34)
!37 = !DILocation(line: 20, column: 7, scope: !29)
!38 = !DILocalVariable(name: "svp_simple_010_001_local_var3", scope: !29, file: !8, line: 22, type: !34)
!39 = !DILocation(line: 22, column: 7, scope: !29)
!40 = !DILocalVariable(name: "svp_simple_010_001_local_var4", scope: !29, file: !8, line: 23, type: !34)
!41 = !DILocation(line: 23, column: 7, scope: !29)
!42 = !DILocation(line: 25, column: 44, scope: !29)
!43 = !DILocation(line: 25, column: 42, scope: !29)
!44 = !DILocation(line: 26, column: 42, scope: !29)
!45 = !DILocation(line: 26, column: 40, scope: !29)
!46 = !DILocation(line: 28, column: 45, scope: !29)
!47 = !DILocation(line: 28, column: 43, scope: !29)
!48 = !DILocation(line: 29, column: 43, scope: !29)
!49 = !DILocation(line: 29, column: 41, scope: !29)
!50 = !DILocation(line: 30, column: 1, scope: !29)
!51 = distinct !DISubprogram(name: "svp_simple_010_001_isr_1", scope: !8, file: !8, line: 32, type: !30, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 33, column: 3, scope: !51)
!53 = !DILocalVariable(name: "reader1", scope: !51, file: !8, line: 34, type: !34)
!54 = !DILocation(line: 34, column: 7, scope: !51)
!55 = !DILocalVariable(name: "reader2", scope: !51, file: !8, line: 34, type: !34)
!56 = !DILocation(line: 34, column: 16, scope: !51)
!57 = !DILocation(line: 36, column: 45, scope: !51)
!58 = !DILocation(line: 36, column: 13, scope: !51)
!59 = !DILocation(line: 36, column: 11, scope: !51)
!60 = !DILocation(line: 38, column: 46, scope: !51)
!61 = !DILocation(line: 38, column: 13, scope: !51)
!62 = !DILocation(line: 38, column: 11, scope: !51)
!63 = !DILocation(line: 39, column: 1, scope: !51)
