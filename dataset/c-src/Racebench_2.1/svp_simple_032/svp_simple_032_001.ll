; ModuleID = 'svp_simple_032_001.bc'
source_filename = "./svp_simple_032_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = call i32 (...) @rand(), !dbg !10
  store volatile i32 %2, i32* @svp_simple_022_001_global_var1, align 4, !dbg !11, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !16
  store volatile i32 %3, i32* @svp_simple_022_001_global_var2, align 4, !dbg !17, !tbaa !12
  %4 = call i32 (...) @rand(), !dbg !18
  store volatile i32 %4, i32* @svp_simple_022_001_global_var3, align 4, !dbg !19, !tbaa !12
  call void (...) @init(), !dbg !20
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !21, !tbaa !12
  %5 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !22, !tbaa !12
  %6 = icmp sge i32 %5, 12, !dbg !23
  br i1 %6, label %7, label %8, !dbg !22

7:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !24, !tbaa !12
  br label %9, !dbg !25

8:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !26, !tbaa !12
  br label %9

9:                                                ; preds = %8, %7
  %10 = bitcast i32* %1 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !27
  store i32 0, i32* %1, align 4, !dbg !28, !tbaa !12
  br label %11, !dbg !29

11:                                               ; preds = %18, %9
  %12 = load i32, i32* %1, align 4, !dbg !30, !tbaa !12
  %13 = icmp slt i32 %12, 256, !dbg !31
  br i1 %13, label %14, label %21, !dbg !32

14:                                               ; preds = %11
  %15 = load i32, i32* %1, align 4, !dbg !33, !tbaa !12
  %16 = sext i32 %15 to i64, !dbg !34
  %17 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %16, !dbg !34
  store volatile i32 0, i32* %17, align 4, !dbg !35, !tbaa !12
  br label %18, !dbg !36

18:                                               ; preds = %14
  %19 = load i32, i32* %1, align 4, !dbg !37, !tbaa !12
  %20 = add nsw i32 %19, 1, !dbg !37
  store i32 %20, i32* %1, align 4, !dbg !37, !tbaa !12
  br label %11, !dbg !32, !llvm.loop !38

21:                                               ; preds = %11
  %22 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !39, !tbaa !12
  store volatile i32 %22, i32* @svp_simple_022_001_global_var3, align 4, !dbg !40, !tbaa !12
  %23 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !41, !tbaa !12
  store volatile i32 %23, i32* @svp_simple_022_001_global_var3, align 4, !dbg !42, !tbaa !12
  %24 = bitcast i32* %1 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #3, !dbg !43
  ret void, !dbg !43
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !44 {
  %1 = call i32 (...) @rand(), !dbg !45
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !46, !tbaa !12
  %2 = call i32 (...) @rand(), !dbg !47
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !48, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !49
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !50, !tbaa !12
  call void (...) @init(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !53 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !54, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !55
  br i1 %2, label %3, label %4, !dbg !54

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !56, !tbaa !12
  br label %5, !dbg !57

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !58, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !59
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !60 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !61, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !62, !tbaa !12
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !64 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !65, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !66
  br i1 %2, label %3, label %4, !dbg !65

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !67, !tbaa !12
  br label %5, !dbg !68

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !69, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !71 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !72, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !73, !tbaa !12
  ret void, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !75 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !76, !tbaa !12
  ret void, !dbg !77
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_032_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_032")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_032_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_032")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 19, column: 38, scope: !7)
!11 = !DILocation(line: 19, column: 36, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 20, column: 38, scope: !7)
!17 = !DILocation(line: 20, column: 36, scope: !7)
!18 = !DILocation(line: 21, column: 38, scope: !7)
!19 = !DILocation(line: 21, column: 36, scope: !7)
!20 = !DILocation(line: 23, column: 5, scope: !7)
!21 = !DILocation(line: 25, column: 34, scope: !7)
!22 = !DILocation(line: 26, column: 11, scope: !7)
!23 = !DILocation(line: 26, column: 42, scope: !7)
!24 = !DILocation(line: 28, column: 40, scope: !7)
!25 = !DILocation(line: 29, column: 7, scope: !7)
!26 = !DILocation(line: 32, column: 40, scope: !7)
!27 = !DILocation(line: 34, column: 3, scope: !7)
!28 = !DILocation(line: 35, column: 10, scope: !7)
!29 = !DILocation(line: 35, column: 8, scope: !7)
!30 = !DILocation(line: 35, column: 15, scope: !7)
!31 = !DILocation(line: 35, column: 17, scope: !7)
!32 = !DILocation(line: 35, column: 3, scope: !7)
!33 = !DILocation(line: 37, column: 37, scope: !7)
!34 = !DILocation(line: 37, column: 5, scope: !7)
!35 = !DILocation(line: 37, column: 40, scope: !7)
!36 = !DILocation(line: 38, column: 3, scope: !7)
!37 = !DILocation(line: 35, column: 25, scope: !7)
!38 = distinct !{!38, !32, !36}
!39 = !DILocation(line: 39, column: 40, scope: !7)
!40 = !DILocation(line: 39, column: 38, scope: !7)
!41 = !DILocation(line: 40, column: 36, scope: !7)
!42 = !DILocation(line: 40, column: 34, scope: !7)
!43 = !DILocation(line: 41, column: 1, scope: !7)
!44 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 44, column: 36, scope: !44)
!46 = !DILocation(line: 44, column: 34, scope: !44)
!47 = !DILocation(line: 45, column: 36, scope: !44)
!48 = !DILocation(line: 45, column: 34, scope: !44)
!49 = !DILocation(line: 46, column: 36, scope: !44)
!50 = !DILocation(line: 46, column: 34, scope: !44)
!51 = !DILocation(line: 48, column: 3, scope: !44)
!52 = !DILocation(line: 49, column: 1, scope: !44)
!53 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 51, type: !9, scopeLine: 51, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 52, column: 9, scope: !53)
!55 = !DILocation(line: 52, column: 40, scope: !53)
!56 = !DILocation(line: 54, column: 38, scope: !53)
!57 = !DILocation(line: 55, column: 5, scope: !53)
!58 = !DILocation(line: 58, column: 38, scope: !53)
!59 = !DILocation(line: 60, column: 1, scope: !53)
!60 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 63, column: 38, scope: !60)
!62 = !DILocation(line: 63, column: 36, scope: !60)
!63 = !DILocation(line: 64, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 66, type: !9, scopeLine: 66, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 67, column: 7, scope: !64)
!66 = !DILocation(line: 67, column: 38, scope: !64)
!67 = !DILocation(line: 69, column: 36, scope: !64)
!68 = !DILocation(line: 70, column: 3, scope: !64)
!69 = !DILocation(line: 73, column: 36, scope: !64)
!70 = !DILocation(line: 75, column: 1, scope: !64)
!71 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 77, type: !9, scopeLine: 77, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 78, column: 36, scope: !71)
!73 = !DILocation(line: 78, column: 34, scope: !71)
!74 = !DILocation(line: 79, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 81, type: !9, scopeLine: 81, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 82, column: 34, scope: !75)
!77 = !DILocation(line: 83, column: 1, scope: !75)
